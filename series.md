---
layout: page
title: "Post Series - Carlos Chacin"
description: "Explore comprehensive multi-part tutorial series on software engineering topics, from Java and Spring Boot to cloud technologies and best practices."
lang: en-us
---

<div class="series-index">
  <div class="series-intro">
    <p class="series-intro-text">
      Dive deep into comprehensive tutorial series covering software engineering topics.
      Each series provides structured learning paths with progressive complexity.
    </p>
  </div>

  {% assign all_series = site.posts | where_exp: "post", "post.series" | group_by: "series" %}

  {% if all_series.size > 0 %}
    <div class="series-grid">
      {% for series in all_series %}
        {% assign series_posts = series.items | sort: "date" %}
        {% assign latest_post = series_posts | last %}
        {% assign total_posts = series_posts.size %}

        <article class="series-card">
          <header class="series-card-header">
            <h2 class="series-card-title">
              <span class="series-card-icon">📚</span>
              {{ series.name }}
            </h2>
            <div class="series-card-meta">
              <span class="series-card-count">{{ total_posts }} part{% if total_posts != 1 %}s{% endif %}</span>
              <span class="series-card-separator">•</span>
              <time class="series-card-date" datetime="{{ latest_post.date | date_to_xmlschema }}">
                Updated {{ latest_post.date | date: "%b %Y" }}
              </time>
            </div>
          </header>

          <div class="series-card-content">
            {% if latest_post.description %}
              <p class="series-card-description">{{ latest_post.description | truncate: 150 }}</p>
            {% else %}
              <p class="series-card-description">{{ latest_post.excerpt | strip_html | truncate: 150 }}</p>
            {% endif %}

            <div class="series-card-posts">
              <h3 class="series-posts-title">Posts in this series:</h3>
              <ol class="series-posts-list">
                {% for post in series_posts limit: 5 %}
                  <li class="series-post-item">
                    <a href="{{ site.baseurl }}{{ post.url }}" class="series-post-link">
                      {{ post.title }}
                    </a>
                    <time class="series-post-date" datetime="{{ post.date | date_to_xmlschema }}">
                      {{ post.date | date: "%b %d, %Y" }}
                    </time>
                  </li>
                {% endfor %}
                {% if series_posts.size > 5 %}
                  {% assign remaining_posts = series_posts.size | minus: 5 %}
                  <li class="series-more">
                    <span class="series-more-text">+ {{ remaining_posts }} more post{% unless remaining_posts == 1 %}s{% endunless %}</span>
                  </li>
                {% endif %}
              </ol>
            </div>

            <div class="series-card-actions">
              <a href="{{ site.baseurl }}{{ series_posts.first.url }}" class="btn btn-primary">
                Start Series
              </a>
              <a href="{{ site.baseurl }}{{ latest_post.url }}" class="btn btn-outline">
                Latest Post
              </a>
            </div>
          </div>

          {% comment %} Show series tags {% endcomment %}
          {% assign series_tags = '' | split: '' %}
          {% for post in series_posts %}
            {% for tag in post.tags %}
              {% unless series_tags contains tag %}
                {% assign series_tags = series_tags | push: tag %}
              {% endunless %}
            {% endfor %}
          {% endfor %}

          {% if series_tags.size > 0 %}
            <footer class="series-card-footer">
              <div class="series-card-tags">
                {% for tag in series_tags limit: 5 %}
                  <span class="series-tag">{{ tag }}</span>
                {% endfor %}
              </div>
            </footer>
          {% endif %}
        </article>
      {% endfor %}
    </div>
  {% else %}
    <div class="series-empty">
      <div class="series-empty-content">
        <span class="series-empty-icon">📚</span>
        <h2 class="series-empty-title">No Series Yet</h2>
        <p class="series-empty-description">
          Post series will appear here as they are created.
          Each series provides structured learning paths on specific topics.
        </p>
        <p class="series-empty-note">
          <strong>For content creators:</strong> Add a <code>series: "Series Name"</code> field to your post frontmatter to create a series.
        </p>
      </div>
    </div>
  {% endif %}
</div>

## How to Use Series

Series are designed to provide **structured learning paths** on complex topics. Each series:

- **Progressive Complexity**: Posts build upon previous knowledge
- **Coherent Narrative**: Each part connects to create a complete picture
- **Easy Navigation**: Jump between parts or follow the recommended sequence
- **Updated Content**: Series are maintained and updated over time

### For Readers
1. **Start from the beginning** for the best learning experience
2. **Use series navigation** to jump between parts
3. **Follow the recommended order** for progressive difficulty
4. **Bookmark the series** to continue later

### For Content Creators
Add this to your post frontmatter to create or join a series:

```yaml
---
title: "Your Post Title"
series: "Your Series Name"
# ... other frontmatter
---
```

Posts with the same series name will automatically be grouped together and sorted by date.