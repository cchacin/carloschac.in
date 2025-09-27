---
layout: default
title: "Projects - Carlos Chacin"
description: "Explore my software engineering projects, open source contributions, and technical demonstrations in Java, Spring Boot, and cloud technologies."
lang: en-us
---

<div class="page">
  <header class="page-header">
    <h1>Projects</h1>
    <p class="page-subtitle">
      A collection of my software engineering projects, open source contributions,
      and technical demonstrations showcasing practical implementations and best practices.
    </p>
  </header>

  <div class="projects-grid">
    {% for project in site.data.projects.featured_projects %}
    <article class="project-card">
      <header class="project-header">
        <h2 class="project-title">{{ project.title }}</h2>
        <div class="project-tags">
          {% for tag in project.tags %}
          <span class="tag">{{ tag }}</span>
          {% endfor %}
        </div>
      </header>
      <div class="project-content">
        <p>{{ project.description }}</p>
        <div class="project-links">
          {% for link in project.links %}
          <a href="{{ link.url }}" class="btn btn-{{ link.type }}" target="_blank" rel="noopener">
            {{ link.text }}
          </a>
          {% endfor %}
        </div>
      </div>
    </article>
    {% endfor %}
  </div>

  <section class="open-source-section">
    <h2 class="section-title">Open Source Contributions</h2>
    <div class="contributions-grid">
      {% for contribution in site.data.projects.open_source %}
      <div class="contribution-item">
        <h3>{{ contribution.title }}</h3>
        <p>{{ contribution.description }}</p>
      </div>
      {% endfor %}
    </div>
  </section>

  <section class="contact-cta">
    <h2>{{ site.data.projects.cta.title }}</h2>
    <p>{{ site.data.projects.cta.description }}</p>
    <a href="{{ site.data.projects.cta.button.url }}" class="btn btn-primary">{{ site.data.projects.cta.button.text }}</a>
  </section>
</div>