#!/bin/bash

# Comprehensive Site Quality Testing Script
# Tests performance, accessibility, SEO, and functionality

echo "🧪 Site Quality Testing Suite"
echo "============================"

# Configuration
SITE_URL="http://localhost:4000"
TEST_DIR="test-results"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Check if we're in the right directory
if [ ! -f "_config.yml" ]; then
    echo "❌ Not in Jekyll root directory. Please run from your blog's root."
    exit 1
fi

# Create test results directory
mkdir -p "$TEST_DIR"

echo "📊 Running quality tests for: $SITE_URL"
echo "Results will be saved to: $TEST_DIR/"

# Function to check if Jekyll is running
check_jekyll_running() {
    if ! curl -s "$SITE_URL" > /dev/null 2>&1; then
        echo "❌ Jekyll site not running at $SITE_URL"
        echo "   Please start Jekyll with: bundle exec jekyll serve"
        exit 1
    fi
    echo "✅ Jekyll site is running"
}

# Function to test HTML validation
test_html_validation() {
    echo ""
    echo "🔍 Testing HTML Validation..."

    # Test homepage HTML structure
    curl -s "$SITE_URL" > "$TEST_DIR/homepage.html"

    # Basic HTML validation checks
    if grep -q "<!DOCTYPE html>" "$TEST_DIR/homepage.html"; then
        echo "✅ Valid HTML5 DOCTYPE found"
    else
        echo "❌ Missing or invalid DOCTYPE"
    fi

    if grep -q "<html lang=" "$TEST_DIR/homepage.html"; then
        echo "✅ Language attribute found"
    else
        echo "⚠️  Missing language attribute"
    fi

    if grep -q "<meta name=\"viewport\"" "$TEST_DIR/homepage.html"; then
        echo "✅ Viewport meta tag found"
    else
        echo "❌ Missing viewport meta tag"
    fi
}

# Function to test accessibility
test_accessibility() {
    echo ""
    echo "♿ Testing Accessibility..."

    # Check for alt text on images
    local missing_alt=0
    curl -s "$SITE_URL" | grep -o '<img[^>]*>' | while read -r img; do
        if ! echo "$img" | grep -q 'alt='; then
            missing_alt=$((missing_alt + 1))
        fi
    done

    if [ $missing_alt -eq 0 ]; then
        echo "✅ All images have alt text"
    else
        echo "⚠️  Found $missing_alt images without alt text"
    fi

    # Check for proper headings
    if curl -s "$SITE_URL" | grep -q "<h1"; then
        echo "✅ H1 heading found"
    else
        echo "❌ Missing H1 heading"
    fi

    # Check for ARIA labels
    if curl -s "$SITE_URL" | grep -q 'aria-label\|role='; then
        echo "✅ ARIA attributes found"
    else
        echo "⚠️  Limited ARIA attributes"
    fi
}

# Function to test SEO
test_seo() {
    echo ""
    echo "🔍 Testing SEO..."

    local homepage_content
    homepage_content=$(curl -s "$SITE_URL")

    # Check title tag
    if echo "$homepage_content" | grep -q "<title>"; then
        local title
        title=$(echo "$homepage_content" | grep -o '<title>[^<]*</title>' | sed 's/<[^>]*>//g')
        if [ ${#title} -ge 30 ] && [ ${#title} -le 60 ]; then
            echo "✅ Title tag length optimal (${#title} chars): $title"
        else
            echo "⚠️  Title tag length suboptimal (${#title} chars): $title"
        fi
    else
        echo "❌ Missing title tag"
    fi

    # Check meta description
    if echo "$homepage_content" | grep -q 'name="description"'; then
        local desc
        desc=$(echo "$homepage_content" | grep -o 'name="description" content="[^"]*"' | sed 's/.*content="\([^"]*\)".*/\1/')
        if [ ${#desc} -ge 120 ] && [ ${#desc} -le 160 ]; then
            echo "✅ Meta description length optimal (${#desc} chars)"
        else
            echo "⚠️  Meta description length suboptimal (${#desc} chars)"
        fi
    else
        echo "❌ Missing meta description"
    fi

    # Check Open Graph tags
    if echo "$homepage_content" | grep -q 'property="og:'; then
        echo "✅ Open Graph tags found"
    else
        echo "❌ Missing Open Graph tags"
    fi

    # Check Twitter Card tags
    if echo "$homepage_content" | grep -q 'name="twitter:'; then
        echo "✅ Twitter Card tags found"
    else
        echo "❌ Missing Twitter Card tags"
    fi

    # Check structured data
    if echo "$homepage_content" | grep -q 'application/ld+json'; then
        echo "✅ Structured data (JSON-LD) found"
    else
        echo "❌ Missing structured data"
    fi
}

# Function to test performance
test_performance() {
    echo ""
    echo "⚡ Testing Performance..."

    # Test page load time
    local start_time end_time load_time
    start_time=$(date +%s%N)
    curl -s "$SITE_URL" > /dev/null
    end_time=$(date +%s%N)
    load_time=$(( (end_time - start_time) / 1000000 )) # Convert to milliseconds

    if [ $load_time -lt 1000 ]; then
        echo "✅ Fast page load time: ${load_time}ms"
    elif [ $load_time -lt 3000 ]; then
        echo "⚠️  Moderate page load time: ${load_time}ms"
    else
        echo "❌ Slow page load time: ${load_time}ms"
    fi

    # Check for compression
    if curl -H "Accept-Encoding: gzip" -s -I "$SITE_URL" | grep -q "Content-Encoding: gzip"; then
        echo "✅ Gzip compression enabled"
    else
        echo "⚠️  Gzip compression not detected"
    fi

    # Check CSS minification
    if curl -s "$SITE_URL/public/css/main.css" | head -1 | grep -q " "; then
        echo "⚠️  CSS appears to be unminified"
    else
        echo "✅ CSS appears to be minified"
    fi
}

# Function to test functionality
test_functionality() {
    echo ""
    echo "⚙️  Testing Functionality..."

    # Test if sitemap exists
    if curl -s -o /dev/null -w "%{http_code}" "$SITE_URL/sitemap.xml" | grep -q "200"; then
        echo "✅ Sitemap accessible"
    else
        echo "❌ Sitemap not accessible"
    fi

    # Test if RSS feed exists
    if curl -s -o /dev/null -w "%{http_code}" "$SITE_URL/feed.xml" | grep -q "200"; then
        echo "✅ RSS feed accessible"
    else
        echo "❌ RSS feed not accessible"
    fi

    # Test if robots.txt exists
    if curl -s -o /dev/null -w "%{http_code}" "$SITE_URL/robots.txt" | grep -q "200"; then
        echo "✅ Robots.txt accessible"
    else
        echo "⚠️  Robots.txt not accessible"
    fi

    # Test critical pages
    local pages=("/" "/about" "/contact" "/projects" "/speaking" "/tags")
    local failed_pages=()

    for page in "${pages[@]}"; do
        local status_code
        status_code=$(curl -s -o /dev/null -w "%{http_code}" "$SITE_URL$page")
        if [ "$status_code" = "200" ]; then
            echo "✅ Page accessible: $page"
        else
            echo "❌ Page failed ($status_code): $page"
            failed_pages+=("$page")
        fi
    done

    if [ ${#failed_pages[@]} -eq 0 ]; then
        echo "✅ All critical pages accessible"
    else
        echo "⚠️  Some pages failed accessibility test"
    fi
}

# Function to generate quality report
generate_quality_report() {
    echo ""
    echo "📋 Generating Quality Report..."

    local report_file="$TEST_DIR/quality_report_$TIMESTAMP.md"

    cat > "$report_file" << EOF
# Site Quality Report - $(date)

## Summary
Site URL: $SITE_URL
Test Date: $(date)
Test Duration: $((SECONDS)) seconds

## Test Results

### HTML Validation
- Valid DOCTYPE: $(curl -s "$SITE_URL" | grep -q "<!DOCTYPE html>" && echo "✅ Pass" || echo "❌ Fail")
- Language attribute: $(curl -s "$SITE_URL" | grep -q "<html lang=" && echo "✅ Pass" || echo "⚠️ Warning")
- Viewport meta: $(curl -s "$SITE_URL" | grep -q 'name="viewport"' && echo "✅ Pass" || echo "❌ Fail")

### SEO
- Title tag: $(curl -s "$SITE_URL" | grep -q "<title>" && echo "✅ Pass" || echo "❌ Fail")
- Meta description: $(curl -s "$SITE_URL" | grep -q 'name="description"' && echo "✅ Pass" || echo "❌ Fail")
- Open Graph: $(curl -s "$SITE_URL" | grep -q 'property="og:' && echo "✅ Pass" || echo "❌ Fail")
- Twitter Cards: $(curl -s "$SITE_URL" | grep -q 'name="twitter:' && echo "✅ Pass" || echo "❌ Fail")
- Structured Data: $(curl -s "$SITE_URL" | grep -q 'application/ld+json' && echo "✅ Pass" || echo "❌ Fail")

### Performance
- Sitemap: $(curl -s -o /dev/null -w "%{http_code}" "$SITE_URL/sitemap.xml" | grep -q "200" && echo "✅ Pass" || echo "❌ Fail")
- RSS Feed: $(curl -s -o /dev/null -w "%{http_code}" "$SITE_URL/feed.xml" | grep -q "200" && echo "✅ Pass" || echo "❌ Fail")

## Recommendations
1. Run this test regularly during development
2. Test on different devices and browsers
3. Use online tools like PageSpeed Insights for additional performance testing
4. Validate accessibility with screen readers
5. Monitor Core Web Vitals in production

## Next Steps
- Fix any failing tests above
- Consider setting up automated testing in CI/CD
- Monitor site performance with analytics
- Regularly audit for accessibility compliance

EOF

    echo "✅ Quality report saved to: $report_file"
}

# Main execution
main() {
    check_jekyll_running
    test_html_validation
    test_accessibility
    test_seo
    test_performance
    test_functionality
    generate_quality_report

    echo ""
    echo "🎉 Site quality testing complete!"
    echo "📊 Results saved to: $TEST_DIR/"
    echo ""
    echo "💡 Next steps:"
    echo "   1. Review the quality report"
    echo "   2. Fix any failing tests"
    echo "   3. Run tests again to verify fixes"
    echo "   4. Consider integrating into CI/CD pipeline"
}

# Run main function
main