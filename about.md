---
layout: default
title: "About & Contact - Carlos Chacin | Senior Software Engineer"
description: "Senior Software Engineer at Walmart Global Tech with 20+ years experience. Get in touch for consulting, speaking opportunities, or technical collaboration."
lang: en-us
---

<div class="page">
  <header class="page-header">
    <h1>About & Contact</h1>
    <p class="page-subtitle">
      Senior Software Engineer with 20+ years experience. Let's connect and explore opportunities to collaborate!
    </p>
  </header>

  <div class="contact-content">
    <!-- About Section -->
    <section class="about-section">
      <h2 class="section-title">Professional Overview</h2>

      <div class="professional-summary">
        <p>Senior Software Engineer with <strong>20+ years</strong> of experience building scalable applications and leading technical initiatives. Currently contributing to <strong>Walmart Global Tech</strong> in Seattle, driving innovation in enterprise-scale systems.</p>
      </div>

      <div class="expertise-grid">
        <div class="expertise-card">
          <div class="service-header">
            <div class="service-icon">🔧</div>
            <h3 class="service-title">Core Expertise</h3>
          </div>
          <ul>
            <li><strong>Backend Development</strong>: Java, Spring Boot, REST APIs, Microservices</li>
            <li><strong>Cloud & DevOps</strong>: AWS, Docker, Kubernetes, CI/CD pipelines</li>
            <li><strong>Frontend</strong>: JavaScript, TypeScript, React, modern web frameworks</li>
            <li><strong>Architecture</strong>: System design, scalable applications, API design</li>
            <li><strong>Practices</strong>: TDD, Unit Testing, Dependency Injection, Clean Code</li>
          </ul>
        </div>

        <div class="expertise-card">
          <div class="service-header">
            <div class="service-icon">📈</div>
            <h3 class="service-title">Leadership & Impact</h3>
          </div>
          <ul>
            <li><strong>Technical Leadership</strong>: Mentoring teams and driving architectural decisions</li>
            <li><strong>Open Source</strong>: Creator of <a href="https://github.com/cchacin/MicroGen">MicroGen</a> and contributor to enterprise projects</li>
            <li><strong>Content Creation</strong>: Educational videos and technical content for developer community</li>
            <li><strong>Bilingual Professional</strong>: Native Spanish and English proficiency</li>
          </ul>
        </div>
      </div>

      <div class="current-focus">
        <h3>🎯 Current Focus</h3>
        <ul>
          <li>Building next-generation microservices at Walmart Global Tech</li>
          <li>Exploring Kotlin, modern JVM languages, and cloud-native technologies</li>
          <li>Creating educational content on Java, Spring Boot, and software engineering best practices</li>
        </ul>
      </div>
    </section>

    <!-- Contact Section -->
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
