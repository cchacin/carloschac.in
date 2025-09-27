---
layout: default
title: "Tags - Carlos Chacin"
description: "Browse all posts by tags and topics. Explore Java, Spring Boot, software engineering, cloud technologies, and development best practices."
lang: en-us
---

<div class="page">
  <header class="page-header">
    <h1>Browse by Tags</h1>
    <p class="page-subtitle">
      Explore posts organized by topics and technologies.
      Find content that matches your interests and learning goals.
    </p>
  </header>

  <div class="tags-page-content">
    {% include tag_cloud.html %}

    <section class="tags-list">
      {% assign sorted_tags = site.tags | sort %}
      {% for tag in sorted_tags %}
        {% assign tag_name = tag[0] %}
        {% assign tag_posts = tag[1] %}
        {% assign post_count = tag_posts | size %}

        <div class="tag-section" id="{{ tag_name | slugify }}">
          <h2 class="tag-section-title">
            {{ tag_name }}
            <span class="tag-post-count">({{ post_count }} post{% if post_count != 1 %}s{% endif %})</span>
          </h2>

          <div class="tag-posts">
            {% for post in tag_posts %}
              <article class="tag-post-item">
                <h3 class="tag-post-title">
                  <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
                </h3>
                <div class="tag-post-meta">
                  <time datetime="{{ post.date | date: '%Y-%m-%d' }}">{{ post.date | date: "%B %d, %Y" }}</time>
                  {% if post.tags.size > 1 %}
                    <div class="tag-post-tags">
                      {% for post_tag in post.tags %}
                        {% unless post_tag == tag_name %}
                          <a href="#{{ post_tag | slugify }}" class="mini-tag">{{ post_tag }}</a>
                        {% endunless %}
                      {% endfor %}
                    </div>
                  {% endif %}
                </div>
                {% if post.excerpt %}
                  <p class="tag-post-excerpt">{{ post.excerpt | strip_html | truncatewords: 25 }}</p>
                {% endif %}
              </article>
            {% endfor %}
          </div>
        </div>
      {% endfor %}
    </section>

    {% if site.tags.size == 0 %}
      <div class="no-tags-message">
        <h2>No tags found</h2>
        <p>Posts will appear here once they have been tagged with relevant topics.</p>
        <a href="{{ site.baseurl }}/" class="btn btn-primary">Browse All Posts</a>
      </div>
    {% endif %}
  </div>
</div>