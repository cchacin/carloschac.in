#!/bin/bash

# Image Optimization Script for Jekyll Blog
# This script helps optimize images for better performance using macOS sips

echo "🖼️  Image Optimization for Jekyll Blog"
echo "======================================"

# Check if sips is available (macOS native tool)
if command -v sips &> /dev/null; then
    echo "✅ Using macOS sips for image optimization"
    USE_SIPS=true
elif command -v convert &> /dev/null; then
    echo "✅ Using ImageMagick for image optimization"
    USE_SIPS=false
else
    echo "❌ No image optimization tool found. Install ImageMagick:"
    echo "   macOS: brew install imagemagick"
    echo "   Ubuntu: sudo apt-get install imagemagick"
    echo "   Windows: Download from https://imagemagick.org/script/download.php"
    exit 1
fi

# Directory containing images
IMAGE_DIR="public/images"

if [ ! -d "$IMAGE_DIR" ]; then
    echo "❌ Images directory '$IMAGE_DIR' not found!"
    exit 1
fi

echo "📁 Scanning directory: $IMAGE_DIR"

# Find and process PNG and JPG files
find "$IMAGE_DIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) | while read -r file; do
    echo "🔍 Processing: $file"

    # Get original file size
    original_size=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null)

    # Create backup
    cp "$file" "$file.backup"

    # Optimize based on file type and available tool
    if [ "$USE_SIPS" = true ]; then
        if [[ "$file" =~ \.(png|PNG)$ ]]; then
            # PNG optimization with sips
            sips -s format png -s formatOptions 70 "$file" --out "$file.optimized"
        else
            # JPG/JPEG optimization with sips
            sips -s format jpeg -s formatOptions 70 "$file" --out "$file.optimized"
        fi
    else
        if [[ "$file" =~ \.(png|PNG)$ ]]; then
            # PNG optimization: reduce colors and remove metadata
            convert "$file" -strip -colors 256 -quality 85 "$file.optimized"
        else
            # JPG/JPEG optimization: reduce quality and remove metadata
            convert "$file" -strip -quality 85 "$file.optimized"
        fi
    fi

    # Get optimized file size
    optimized_size=$(stat -f%z "$file.optimized" 2>/dev/null || stat -c%s "$file.optimized" 2>/dev/null)

    # Calculate size reduction
    reduction=$(( (original_size - optimized_size) * 100 / original_size ))

    if [ $reduction -gt 5 ]; then
        # Replace original if significant reduction
        mv "$file.optimized" "$file"
        echo "✅ Optimized: $(basename "$file") - Reduced by ${reduction}%"
        rm "$file.backup"
    else
        # Keep original if minimal benefit
        rm "$file.optimized"
        mv "$file.backup" "$file"
        echo "⏭️  Skipped: $(basename "$file") - Minimal benefit (${reduction}%)"
    fi
done

echo ""
echo "🎉 Image optimization complete!"
echo ""
echo "📝 Next steps:"
echo "   1. Test your site locally: bundle exec jekyll serve"
echo "   2. Check that images load correctly"
echo "   3. Commit changes if everything looks good"
echo ""
echo "💡 Tips:"
echo "   - Consider using WebP format for better compression"
echo "   - Use responsive images with srcset for different screen sizes"
echo "   - Implement lazy loading for images below the fold"