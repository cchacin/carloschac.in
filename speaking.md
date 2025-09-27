---
layout: default
title: "Speaking & Talks - Carlos Chacin"
description: "Carlos Chacin's speaking engagements, conference talks, and presentations on Java, Spring Boot, software architecture, and modern development practices."
lang: en-us
---

<div class="page">
  <header class="page-header">
    <h1>Speaking & Talks</h1>
    <p class="page-subtitle">
      Sharing knowledge and experiences through conference talks, workshops,
      and community presentations on software engineering and modern development practices.
    </p>
  </header>

  <section class="upcoming-talks">
    <h2 class="section-title">Upcoming Speaking Engagements</h2>
    <div class="talks-list">
      {% for talk in site.data.speaking.upcoming_talks %}
      <article class="talk-item upcoming">
        <div class="talk-date">
          <span class="date-month">{{ talk.date }}</span>
          <span class="date-year">{{ talk.year }}</span>
        </div>
        <div class="talk-content">
          <h3 class="talk-title">{{ talk.title }}</h3>
          <p class="talk-venue">{{ talk.venue }}</p>
          <p class="talk-description">{{ talk.description }}</p>
          <div class="talk-tags">
            {% for tag in talk.tags %}
            <span class="tag">{{ tag }}</span>
            {% endfor %}
          </div>
        </div>
      </article>
      {% endfor %}
    </div>
  </section>

  <section class="past-talks">
    <h2 class="section-title">Recent Presentations</h2>
    <div class="talks-list">
      {% for talk in site.data.speaking.past_talks %}
      <article class="talk-item">
        <div class="talk-date">
          <span class="date-month">{{ talk.month }}</span>
          <span class="date-year">{{ talk.year }}</span>
        </div>
        <div class="talk-content">
          <h3 class="talk-title">{{ talk.title }}</h3>
          <p class="talk-venue">{{ talk.venue }}</p>
          <p class="talk-description">{{ talk.description }}</p>
          <div class="talk-tags">
            {% for tag in talk.tags %}
            <span class="tag">{{ tag }}</span>
            {% endfor %}
          </div>
          {% if talk.links %}
          <div class="talk-links">
            {% for link in talk.links %}
            <a href="{{ link.url }}" class="btn btn-{{ link.type }}" target="_blank" rel="noopener">
              {{ link.text }}
            </a>
            {% endfor %}
          </div>
          {% endif %}
        </div>
      </article>
      {% endfor %}
    </div>
  </section>

  <section class="speaking-topics">
    <h2 class="section-title">Speaking Topics</h2>
    <div class="topics-grid">
      {% for topic in site.data.speaking.speaking_topics %}
      <div class="topic-card">
        <h3>{{ topic.icon }} {{ topic.title }}</h3>
        <p>{{ topic.description }}</p>
      </div>
      {% endfor %}
    </div>
  </section>

  <section class="speaking-cta">
    <h2>{{ site.data.speaking.cta.title }}</h2>
    <p>{{ site.data.speaking.cta.description }}</p>
    <div class="cta-actions">
      {% for button in site.data.speaking.cta.buttons %}
      <a href="{{ button.url }}"
         class="btn btn-{{ button.type }}"
         {% if button.external %}target="_blank" rel="noopener"{% endif %}>
        {{ button.text }}
      </a>
      {% endfor %}
    </div>
  </section>
</div>