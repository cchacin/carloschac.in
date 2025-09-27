# Jekyll Blog Style Guide

Comprehensive style guide for maintaining consistency across the Jekyll blog.

## 🎨 Design System

### Color Palette

```scss
// Primary Colors
--primary-color: #0074d9;      // Main brand blue
--primary-hover: #0056b3;      // Darker blue for hover states
--secondary-color: #2c3e50;    // Dark slate for secondary elements
--accent-color: #e74c3c;       // Red accent for highlights

// Text Colors
--text-primary: #222;          // Main text
--text-secondary: #666;        // Secondary text
--text-muted: #999;           // Muted/disabled text
--text-inverse: #fff;         // White text for dark backgrounds

// Background Colors
--bg-primary: #fff;           // Main background
--bg-secondary: #f8f8f8;      // Secondary background
--bg-accent: #f0f8ff;         // Light blue accent background
--border-color: #eee;         // Standard borders
--border-light: #f5f5f5;      // Light borders
```

### Typography Scale

```scss
// Font Sizes (responsive)
--font-size-xs: 0.75rem;      // 12px
--font-size-sm: 0.875rem;     // 14px
--font-size-base: 1rem;       // 16px
--font-size-lg: 1.125rem;     // 18px
--font-size-xl: 1.25rem;      // 20px
--font-size-2xl: 1.5rem;      // 24px
--font-size-3xl: 1.75rem;     // 28px
--font-size-4xl: 2rem;        // 32px
--font-size-5xl: 2.5rem;      // 40px
```

### Spacing System

```scss
// Consistent spacing scale
--space-xs: 0.25rem;   // 4px
--space-sm: 0.5rem;    // 8px
--space-md: 1rem;      // 16px
--space-lg: 1.5rem;    // 24px
--space-xl: 2rem;      // 32px
--space-2xl: 3rem;     // 48px
--space-3xl: 4rem;     // 64px
```

### Border Radius

```scss
--radius-sm: 3px;      // Small radius for tags, badges
--radius-md: 4px;      // Standard radius for buttons, inputs
--radius-lg: 8px;      // Large radius for cards, sections
--radius-xl: 12px;     // Extra large for hero sections
--radius-full: 50%;    // Circular elements
```

## 📝 Content Guidelines

### Writing Style

1. **Tone**: Professional but approachable
2. **Voice**: First person when sharing experiences, third person for tutorials
3. **Clarity**: Use simple, direct language
4. **Structure**: Lead with the most important information

### Post Structure

```markdown
---
title: "Clear, Descriptive Title (Max 60 chars)"
description: "Brief description for SEO (120-160 chars)"
date: 2024-01-01
tags: [java, spring-boot, tutorial]
series: "Series Name" # Optional
comments: true # Optional, defaults to true
image: "/public/images/post-image.png" # Optional
---

# Post Title

Brief introduction paragraph that explains what the reader will learn.

<!-- more --> <!-- Excerpt separator -->

## Main Content

### Subsections

Use H3 for subsections under main topics.

#### Code Examples

\```java
public class Example {
    // Well-commented, working code
}
\```

## Conclusion

Summary of key takeaways and next steps.
```

### Image Guidelines

1. **Alt Text**: Always provide descriptive alt text
2. **Lazy Loading**: Use `loading="lazy"` for images below the fold
3. **Responsive**: Use the responsive image include when possible
4. **Optimization**: Images should be under 100KB when possible

```html
<!-- Preferred: Use responsive image include -->
{% include responsive_image.html
   src="/public/images/example.png"
   alt="Descriptive alt text"
   caption="Optional caption" %}

<!-- Standard: With lazy loading -->
![Alt text](path/to/image.png){:loading="lazy"}
```

## 🎯 Component Usage

### Buttons

```html
<!-- Primary action -->
<a href="#" class="btn btn-primary">Primary Action</a>

<!-- Secondary action -->
<a href="#" class="btn btn-secondary">Secondary Action</a>

<!-- Outline style -->
<a href="#" class="btn btn-outline">Learn More</a>
```

### Social Sharing

```liquid
<!-- Automatic inclusion in posts -->
{% include social_sharing.html %}
```

### Author Bio

```liquid
<!-- Full bio (for About page) -->
{% include author_bio.html %}

<!-- Compact bio (for posts) -->
{% include author_bio.html compact=true %}
```

### Newsletter Signup

```liquid
<!-- Default -->
{% include newsletter_signup.html %}

<!-- Custom -->
{% include newsletter_signup.html
   title="Custom Title"
   description="Custom description" %}

<!-- Inline version -->
{% include newsletter_signup.html inline=true %}
```

### Comments

```liquid
<!-- Automatic inclusion in posts -->
{% include comments.html %}
```

## 🔧 Technical Standards

### File Organization

```
├── _includes/           # Reusable components
│   ├── author_bio.html
│   ├── comments.html
│   ├── newsletter_signup.html
│   ├── responsive_image.html
│   └── social_sharing.html
├── _layouts/           # Page templates
├── _posts/            # Blog posts (YYYY-MM-DD-title.md)
├── claudedocs/        # Documentation and guides
├── public/
│   ├── css/           # Stylesheets
│   ├── images/        # Image assets
│   └── js/            # JavaScript files
└── scripts/           # Utility scripts
```

### Naming Conventions

1. **Files**: Use kebab-case (`post-title.md`)
2. **CSS Classes**: Use kebab-case (`nav-card`, `author-bio`)
3. **CSS Variables**: Use kebab-case (`--primary-color`)
4. **Jekyll Variables**: Use snake_case (`post_title`)

### Code Standards

1. **Indentation**: 2 spaces for HTML/CSS/SCSS, 4 spaces for JavaScript
2. **Comments**: Comment complex logic and component purposes
3. **Accessibility**: Always include ARIA labels and semantic HTML
4. **Performance**: Minimize CSS/JS, optimize images, use lazy loading

## 📱 Responsive Design

### Breakpoints

```scss
@media (max-width: 480px)  { /* Mobile */ }
@media (max-width: 768px)  { /* Tablet */ }
@media (max-width: 1024px) { /* Small desktop */ }
@media (min-width: 1025px) { /* Large desktop */ }
```

### Mobile-First Approach

1. Design for mobile first
2. Enhance for larger screens
3. Test on multiple devices
4. Ensure touch targets are minimum 44px

## ♿ Accessibility Standards

### Required Elements

1. **Alt Text**: All images must have descriptive alt text
2. **Headings**: Proper heading hierarchy (H1 → H2 → H3)
3. **Labels**: Form inputs must have associated labels
4. **Focus**: Keyboard navigation must be functional
5. **Color**: Don't rely solely on color to convey meaning
6. **Contrast**: Text must meet WCAG contrast requirements

### ARIA Implementation

```html
<!-- Navigation -->
<nav role="navigation" aria-label="Main navigation">

<!-- Main content -->
<main role="main">

<!-- Articles -->
<article role="article" aria-labelledby="post-title">

<!-- Skip links -->
<a href="#main-content" class="skip-link">Skip to main content</a>
```

## 🔍 SEO Best Practices

### Meta Tags

```html
<!-- Required in all pages -->
<title>Page Title (30-60 chars)</title>
<meta name="description" content="Description (120-160 chars)">

<!-- Open Graph -->
<meta property="og:title" content="Page Title">
<meta property="og:description" content="Description">
<meta property="og:image" content="Image URL">

<!-- Twitter Cards -->
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="Page Title">
```

### Structured Data

All posts automatically include JSON-LD structured data for:
- Article schema
- Author information
- Publishing dates
- Organization details

### URL Structure

- **Posts**: `/YYYY/MM/DD/post-title/`
- **Pages**: `/page-name/`
- **Tags**: `/tags/#tag-name`
- **Series**: `/series/#series-name`

## 🧪 Testing Checklist

### Before Publishing

- [ ] Content proofread and spell-checked
- [ ] Images optimized and have alt text
- [ ] Links work and open appropriately
- [ ] Mobile responsive design tested
- [ ] Accessibility validated
- [ ] SEO meta tags complete

### Quality Assurance

```bash
# Run quality tests
./scripts/test-site-quality.sh

# Run performance check
./scripts/performance-check.sh

# Optimize images if needed
./scripts/optimize-images.sh
```

## 🚀 Deployment

### Pre-Deployment

1. Test locally with `bundle exec jekyll serve`
2. Run quality tests
3. Check for broken links
4. Validate HTML and CSS
5. Test on multiple browsers

### Post-Deployment

1. Verify site loads correctly
2. Test critical user journeys
3. Check analytics setup
4. Validate sitemap and RSS feed
5. Monitor Core Web Vitals

## 🔄 Maintenance

### Regular Tasks

- **Weekly**: Review and respond to comments
- **Monthly**: Update dependencies, check for broken links
- **Quarterly**: Audit site performance and accessibility
- **Annually**: Review and update style guide

### Version Control

- Use semantic commit messages
- Create feature branches for major changes
- Include Claude Code generation attribution in commits

## 📚 Resources

### Tools

- [WAVE Accessibility Checker](https://wave.webaim.org/)
- [PageSpeed Insights](https://pagespeed.web.dev/)
- [HTML Validator](https://validator.w3.org/)
- [Lighthouse](https://developers.google.com/web/tools/lighthouse)

### Documentation

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [WCAG Guidelines](https://www.w3.org/WAI/WCAG21/quickref/)
- [Schema.org](https://schema.org/)

---

*This style guide is a living document. Update it as the site evolves and new patterns emerge.*