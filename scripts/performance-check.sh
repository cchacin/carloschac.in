#!/bin/bash

# Performance Check Script for Jekyll Blog
# Quick checks for performance optimization

echo "⚡ Performance Check for Jekyll Blog"
echo "===================================="

# Check if we're in the right directory
if [ ! -f "_config.yml" ]; then
    echo "❌ Not in Jekyll root directory. Please run from your blog's root."
    exit 1
fi

echo "📊 Checking current optimizations..."

# Check SASS compression
if grep -q "style: compressed" _config.yml; then
    echo "✅ CSS minification enabled"
else
    echo "⚠️  CSS minification not enabled. Add 'sass: { style: compressed }' to _config.yml"
fi

# Check for performance plugins
if grep -q "jekyll-sitemap" _config.yml; then
    echo "✅ Sitemap plugin enabled"
else
    echo "⚠️  Sitemap plugin not found"
fi

if grep -q "jekyll-feed" _config.yml; then
    echo "✅ RSS feed plugin enabled"
else
    echo "⚠️  RSS feed plugin not found"
fi

if grep -q "jekyll-seo-tag" _config.yml; then
    echo "✅ SEO tag plugin enabled"
else
    echo "⚠️  SEO tag plugin not found"
fi

# Check for lazy loading in posts
lazy_images=$(find _posts -name "*.md" -exec grep -l 'loading="lazy"' {} \; 2>/dev/null | wc -l)
total_posts=$(find _posts -name "*.md" | wc -l)
echo "✅ Lazy loading found in $lazy_images out of $total_posts posts"

# Check for responsive image include
if [ -f "_includes/responsive_image.html" ]; then
    echo "✅ Responsive image include available"
else
    echo "⚠️  Responsive image include not found"
fi

# Check for image optimization opportunities
large_images=$(find public/images -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) -size +100k 2>/dev/null | wc -l)
if [ $large_images -gt 0 ]; then
    echo "⚠️  Found $large_images images larger than 100KB. Consider optimizing with scripts/optimize-images.sh"
else
    echo "✅ No large images found"
fi

# Check for meta tags
if grep -q "og:image" _includes/head.html; then
    echo "✅ Open Graph meta tags present"
else
    echo "⚠️  Open Graph meta tags missing"
fi

if grep -q "twitter:card" _includes/head.html; then
    echo "✅ Twitter Card meta tags present"
else
    echo "⚠️  Twitter Card meta tags missing"
fi

# Check for structured data
if grep -q "application/ld+json" _includes/head.html; then
    echo "✅ Structured data (JSON-LD) present"
else
    echo "⚠️  Structured data missing"
fi

echo ""
echo "🎯 Performance Score Summary:"
echo "=========================="

score=0
total_checks=9

[ -f "_includes/responsive_image.html" ] && ((score++))
grep -q "style: compressed" _config.yml && ((score++))
grep -q "jekyll-sitemap" _config.yml && ((score++))
grep -q "jekyll-feed" _config.yml && ((score++))
grep -q "jekyll-seo-tag" _config.yml && ((score++))
grep -q "og:image" _includes/head.html && ((score++))
grep -q "twitter:card" _includes/head.html && ((score++))
grep -q "application/ld+json" _includes/head.html && ((score++))
[ $large_images -eq 0 ] && ((score++))

percentage=$((score * 100 / total_checks))

echo "Score: $score/$total_checks ($percentage%)"

if [ $percentage -ge 90 ]; then
    echo "🎉 Excellent! Your site is well optimized."
elif [ $percentage -ge 70 ]; then
    echo "👍 Good optimization, minor improvements possible."
elif [ $percentage -ge 50 ]; then
    echo "⚠️  Moderate optimization, several improvements needed."
else
    echo "❌ Poor optimization, many improvements needed."
fi

echo ""
echo "💡 Next steps:"
echo "   1. Run 'bundle exec jekyll serve' to test locally"
echo "   2. Use browser dev tools to check Core Web Vitals"
echo "   3. Test site speed with tools like GTmetrix or PageSpeed Insights"
echo "   4. Consider implementing WebP images for better compression"