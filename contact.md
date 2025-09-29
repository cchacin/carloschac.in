---
layout: default
title: "Contact - Carlos Chacin"
description: "Get in touch with Carlos Chacin for consulting, speaking opportunities, collaboration on software engineering projects, or technical discussions."
lang: en-us
---

<div class="page">
  <header class="page-header">
    <h1>Contact</h1>
    <p class="page-subtitle">
      Let's connect! I'm always interested in discussing software engineering,
      exploring collaboration opportunities, and sharing knowledge with the community.
    </p>
  </header>

  <div class="contact-content">
    <section class="contact-methods">
      <h2 class="section-title">Get In Touch</h2>
      <div class="contact-grid">
        {% for method in site.data.contact.contact_methods %}
        <div class="contact-card">
          <div class="contact-icon">{{ method.icon }}</div>
          <h3>{{ method.title }}</h3>
          <p>{{ method.description }}</p>
          <a href="{{ method.button.url }}"
             class="btn btn-{{ method.button.type }}"
             {% if method.button.external %}target="_blank" rel="noopener"{% endif %}>
            {{ method.button.text }}
          </a>
        </div>
        {% endfor %}
      </div>
    </section>

    <section class="consultation-info">
      <h2 class="section-title">Consultation & Services</h2>
      <div class="services-grid">
        {% for service in site.data.contact.services %}
        <div class="service-item">
          <div class="service-header">
            <div class="service-icon">{{ service.icon }}</div>
            <h3 class="service-title">{{ service.title }}</h3>
          </div>
          <p>{{ service.description }}</p>
        </div>
        {% endfor %}
      </div>
    </section>

    <section class="response-expectations">
      <h2 class="section-title">Response Times</h2>
      <div class="response-info">
        {% for response in site.data.contact.response_times %}
        <div class="response-item">
          <strong>{{ response.type }}:</strong>
          <span>{{ response.time }}</span>
        </div>
        {% endfor %}
      </div>
    </section>

    <section class="contact-note">
      <div class="note-content">
        <h3>{{ site.data.contact.contact_note.title }}</h3>
        <p>{{ site.data.contact.contact_note.description }}</p>
        <ul>
          {% for item in site.data.contact.contact_note.items %}
          <li>{{ item }}</li>
          {% endfor %}
        </ul>
      </div>
    </section>
  </div>
</div>