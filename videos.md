---
layout: default
title: Videos
description: "Educational content on Java development, software architecture, and programming best practices."
---

<style>
.videos-hero {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  padding: 4rem 0;
  text-align: center;
}

.videos-hero h1 {
  font-size: 3rem;
  margin-bottom: 1rem;
  font-weight: 700;
}

.videos-hero p {
  font-size: 1.2rem;
  opacity: 0.9;
  max-width: 600px;
  margin: 0 auto;
}

.featured-section {
  padding: 4rem 0;
  background: var(--bg-secondary);
}

.featured-section h2 {
  text-align: center;
  margin-bottom: 3rem;
  font-size: 2.5rem;
  color: var(--text-primary);
}

.video-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
  gap: 2rem;
  margin-bottom: 4rem;
}

.video-card {
  background: var(--bg-primary);
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 4px 6px var(--shadow-color);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  border: 1px solid var(--border-color);
}

.video-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 25px var(--shadow-color-hover);
}

.video-thumbnail {
  position: relative;
  overflow: hidden;
  background: #000;
}

.video-thumbnail img {
  width: 100%;
  height: 200px;
  object-fit: cover;
  transition: transform 0.3s ease;
}

.video-card:hover .video-thumbnail img {
  transform: scale(1.05);
}

.play-button {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: rgba(255, 255, 255, 0.9);
  border: none;
  border-radius: 50%;
  width: 60px;
  height: 60px;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: all 0.3s ease;
}

.play-button:hover {
  background: var(--bg-primary);
  transform: translate(-50%, -50%) scale(1.1);
}

.play-button::after {
  content: '';
  width: 0;
  height: 0;
  border-left: 15px solid var(--text-primary);
  border-top: 10px solid transparent;
  border-bottom: 10px solid transparent;
  margin-left: 3px;
}

.video-duration {
  position: absolute;
  bottom: 8px;
  right: 8px;
  background: rgba(0, 0, 0, 0.8);
  color: var(--text-inverse);
  padding: 2px 6px;
  border-radius: 4px;
  font-size: 0.8rem;
  font-weight: 500;
}

.featured-badge {
  position: absolute;
  top: 8px;
  left: 8px;
  background: linear-gradient(135deg, var(--ctp-red), var(--ctp-peach));
  color: var(--text-inverse);
  padding: 4px 8px;
  border-radius: 4px;
  font-size: 0.7rem;
  font-weight: 600;
  text-transform: uppercase;
}

.video-content {
  padding: 1.5rem;
}

.video-content h3 {
  margin: 0 0 0.5rem 0;
  font-size: 1.1rem;
  font-weight: 600;
  color: var(--text-primary);
  line-height: 1.4;
}

.video-content p {
  color: var(--text-secondary);
  font-size: 0.9rem;
  line-height: 1.5;
  margin-bottom: 1rem;
}

.video-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
}

.tag {
  background: var(--bg-secondary);
  color: var(--text-secondary);
  padding: 0.25rem 0.5rem;
  border-radius: 4px;
  font-size: 0.75rem;
  font-weight: 500;
}

.video-analytics {
  display: flex;
  align-items: center;
  gap: 1rem;
  margin-top: 0.75rem;
  padding-top: 0.75rem;
  border-top: 1px solid var(--border-color);
  font-size: 0.8rem;
  color: var(--text-secondary);
}

.analytics-item {
  display: flex;
  align-items: center;
  gap: 0.25rem;
}

.analytics-icon {
  font-size: 0.7rem;
  opacity: 0.7;
}

.analytics-value {
  font-weight: 500;
}

.all-videos-section {
  padding: 4rem 0;
}

.all-videos-section h2 {
  text-align: center;
  margin-bottom: 3rem;
  font-size: 2.5rem;
  color: var(--text-primary);
}

.topics-section {
  padding: 4rem 0;
  background: var(--bg-secondary);
}

.topics-section h2 {
  text-align: center;
  margin-bottom: 3rem;
  font-size: 2.5rem;
  color: var(--text-primary);
}

.topics-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 2rem;
}

.topic-card {
  text-align: center;
  padding: 2rem 1rem;
  background: var(--bg-primary);
  border-radius: 12px;
  box-shadow: 0 2px 4px var(--shadow-color);
  transition: transform 0.3s ease;
}

.topic-card:hover {
  transform: translateY(-5px);
}

.topic-card .icon {
  font-size: 3rem;
  margin-bottom: 1rem;
}

.topic-card h3 {
  margin-bottom: 1rem;
  color: var(--text-primary);
}

.topic-card p {
  color: var(--text-secondary);
  font-size: 0.9rem;
}

.cta-section {
  padding: 4rem 0;
  text-align: center;
  background: linear-gradient(135deg, var(--ctp-blue), var(--ctp-mauve));
  color: var(--text-inverse);
}

.cta-section h2 {
  margin-bottom: 1rem;
  font-size: 2.5rem;
}

.cta-section p {
  margin-bottom: 2rem;
  font-size: 1.1rem;
  opacity: 0.9;
  max-width: 600px;
  margin-left: auto;
  margin-right: auto;
}

.cta-buttons {
  display: flex;
  gap: 1rem;
  justify-content: center;
  flex-wrap: wrap;
}

.btn {
  display: inline-block;
  padding: 0.75rem 1.5rem;
  border-radius: 6px;
  text-decoration: none;
  font-weight: 600;
  transition: all 0.3s ease;
  border: 2px solid transparent;
}

.btn-primary {
  background: var(--bg-primary);
  color: var(--ctp-blue);
}

.btn-primary:hover {
  background: var(--bg-secondary);
  transform: translateY(-2px);
}

.btn-secondary {
  background: transparent;
  color: var(--text-inverse);
  border-color: var(--text-inverse);
}

.btn-secondary:hover {
  background: var(--bg-primary);
  color: var(--ctp-blue);
}

@media (max-width: 768px) {
  .videos-hero h1 {
    font-size: 2rem;
  }

  .videos-hero p {
    font-size: 1rem;
  }

  .video-grid {
    grid-template-columns: 1fr;
    gap: 1rem;
  }

  .topics-grid {
    grid-template-columns: 1fr;
    gap: 1rem;
  }

  .cta-buttons {
    flex-direction: column;
    align-items: center;
  }

  .btn {
    width: 100%;
    max-width: 300px;
  }

  .video-analytics {
    gap: 0.75rem;
    font-size: 0.75rem;
  }

  .analytics-item {
    gap: 0.2rem;
  }
}
</style>

<div class="videos-hero">
  <div class="container">
    <h1>📺 Videos</h1>
    <p>Educational content on Java development, software architecture, and programming best practices</p>
  </div>
</div>

{% assign featured_videos = site.data.videos.videos | where: "featured", true %}
{% if featured_videos and featured_videos.size > 0 %}
<section class="featured-section">
  <div class="container">
    <h2>🌟 Featured Videos</h2>
    <div class="video-grid">
      {% for video in featured_videos %}
      <div class="video-card">
        <div class="video-thumbnail">
          <a href="https://www.youtube.com/watch?v={{ video.youtube_id }}" target="_blank" rel="noopener">
            <img src="https://img.youtube.com/vi/{{ video.youtube_id }}/maxresdefault.jpg"
                 alt="{{ video.title }}"
                 loading="lazy">
            <div class="play-button"></div>
          </a>
          {% if video.duration %}
          <div class="video-duration">{{ video.duration }}</div>
          {% endif %}
          {% if video.featured %}
          <div class="featured-badge">Featured</div>
          {% endif %}
        </div>
        <div class="video-content">
          <h3>
            <a href="https://www.youtube.com/watch?v={{ video.youtube_id }}" target="_blank" rel="noopener">
              {{ video.title }}
            </a>
          </h3>
          <p>{{ video.description }}</p>
          {% if video.tags %}
          <div class="video-tags">
            {% for tag in video.tags %}
            <span class="tag">{{ tag }}</span>
            {% endfor %}
          </div>
          {% endif %}
          {% if video.analytics %}
          <div class="video-analytics">
            <div class="analytics-item">
              <span class="analytics-icon">👁️</span>
              <span class="analytics-value">{{ video.analytics.views | number_with_delimiter }}</span>
            </div>
            {% if video.analytics.likes %}
            <div class="analytics-item">
              <span class="analytics-icon">👍</span>
              <span class="analytics-value">{{ video.analytics.likes }}</span>
            </div>
            {% endif %}
            {% if video.analytics.engagement %}
            <div class="analytics-item">
              <span class="analytics-icon">📊</span>
              <span class="analytics-value">{{ video.analytics.engagement }}</span>
            </div>
            {% endif %}
          </div>
          {% endif %}
        </div>
      </div>
      {% endfor %}
    </div>
  </div>
</section>
{% endif %}

<section class="all-videos-section">
  <div class="container">
    <h2>📚 All Videos</h2>
    <div class="video-grid">
      {% for video in site.data.videos.videos %}
      <div class="video-card">
        <div class="video-thumbnail">
          <a href="https://www.youtube.com/watch?v={{ video.youtube_id }}" target="_blank" rel="noopener">
            <img src="https://img.youtube.com/vi/{{ video.youtube_id }}/maxresdefault.jpg"
                 alt="{{ video.title }}"
                 loading="lazy">
            <div class="play-button"></div>
          </a>
          {% if video.duration %}
          <div class="video-duration">{{ video.duration }}</div>
          {% endif %}
          {% if video.featured %}
          <div class="featured-badge">Featured</div>
          {% endif %}
        </div>
        <div class="video-content">
          <h3>
            <a href="https://www.youtube.com/watch?v={{ video.youtube_id }}" target="_blank" rel="noopener">
              {{ video.title }}
            </a>
          </h3>
          <p>{{ video.description }}</p>
          {% if video.tags %}
          <div class="video-tags">
            {% for tag in video.tags %}
            <span class="tag">{{ tag }}</span>
            {% endfor %}
          </div>
          {% endif %}
          {% if video.analytics %}
          <div class="video-analytics">
            <div class="analytics-item">
              <span class="analytics-icon">👁️</span>
              <span class="analytics-value">{{ video.analytics.views | number_with_delimiter }}</span>
            </div>
            {% if video.analytics.likes %}
            <div class="analytics-item">
              <span class="analytics-icon">👍</span>
              <span class="analytics-value">{{ video.analytics.likes }}</span>
            </div>
            {% endif %}
            {% if video.analytics.engagement %}
            <div class="analytics-item">
              <span class="analytics-icon">📊</span>
              <span class="analytics-value">{{ video.analytics.engagement }}</span>
            </div>
            {% endif %}
          </div>
          {% endif %}
        </div>
      </div>
      {% endfor %}
    </div>
  </div>
</section>

{% if site.data.videos.topics %}
<section class="topics-section">
  <div class="container">
    <h2>🎯 Video Topics</h2>
    <div class="topics-grid">
      {% for topic in site.data.videos.topics %}
      <div class="topic-card">
        <div class="icon">{{ topic.icon }}</div>
        <h3>{{ topic.title }}</h3>
        <p>{{ topic.description }}</p>
      </div>
      {% endfor %}
    </div>
  </div>
</section>
{% endif %}

{% if site.data.videos.cta %}
<section class="cta-section">
  <div class="container">
    <h2>{{ site.data.videos.cta.title }}</h2>
    <p>{{ site.data.videos.cta.description }}</p>
    <div class="cta-buttons">
      {% for button in site.data.videos.cta.buttons %}
      <a href="{{ button.url }}"
         class="btn btn-{{ button.type }}"
         {% if button.external %}target="_blank" rel="noopener"{% endif %}>
        {{ button.text }}
      </a>
      {% endfor %}
    </div>
  </div>
</section>
{% endif %}