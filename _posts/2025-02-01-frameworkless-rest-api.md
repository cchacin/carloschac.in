---
layout: post
title: Crea una REST API sin usar ningún Framework con Java Servlets, JDBC, PostgreSQL y Jackson
date: 2025-02-01 08:00 -0700
description:  Crea una REST API sin usar ningún Framework con Java Servlets, JDBC, PostgreSQL y Jackson
lang: es-es
author: cchacin
tags: java jdbc postgres postgresql rest api frameworkless servlets
---

## Crea una REST API sin usar ningún Framework con Java Servlets, JDBC, PostgreSQL y Jackson

En éste video, veremos como implementar una REST API sin usar ningún framework como Quarkus, Micronaut, Helidon o Spring Boot.
Usaremos Servlets para exponer la API, JDBC para conectarnos a PostgreSQL y Jackson para la serialización a JSON, Integration Testing con Junit5, AssertJ y TestContainers.

Recursos:

- Jetty: https://jetty.org/
- HikariCP: https://github.com/brettwooldridge/HikariCP
- 12 Factor Apps: https://12factor.net/
- Código: https://github.com/cchacin/frameworkless-rest-api

### Parte 1
<iframe width="560" height="315" src="https://www.youtube.com/embed/-UVrMS43uEQ?si=93KAZ9J7EnZgu7Ty" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

### Parte 2
<iframe width="560" height="315" src="https://www.youtube.com/embed/b8E3WhSWLhs?si=Qjca1rd11r73aeqr" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

```
 ┌ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─
  Servlet Container                                                                   │
 │-----------------             ┌───────────────┐
  Jetty                         │ Serialization │                                     │
 │                              ├───────────────┤
                                │     JSON      │                                     │
 │        ┌───────────────┐     │    -------    │◀─────┐
          │     REST      │     │    Jackson    │      │                              │
 │        ├───────────────┤     └───────────────┘      │
          │   API Layer   │                            │                              │
 │        │   --------    │◀────────────────┐          │
          │   Servlets    │                 │          │                              │
 │        └───────────────┘                 │          │
                                            │          │                              │
 │                                          │          │
                                            │          │                              │
 │        ┌───────────────┐                 │          │       ┌───────────────┐
          │   Core DTOs   │                 │          │       │     Main      │      │
 │        ├───────────────┤                 │          │       ├───────────────┤
          │ Service Layer │                 │          │       │   App Layer   │      │
 │        │ ------------- │◀────────────────┼──────────┴───────│ ------------- │
          │  Plain Java   │                 │                  │  Plain Java   │      │
 │        └───────────────┘                 │                  └───────────────┘
                                            │                                         │
 │                                          │
                                            │                                         │
 │        ┌───────────────┐                 │
          │    DB DTOs    │                 │                                         │
 │        ├───────────────┤                 │
          │  Data Layer   │                 │                                         │
 │        │---------------│◀────────────────┘
          │JDBC / Postgres│                                                           │
 │        └───────────────┘
                  │                                                                   │
 │                │
                  │                                                                   │
 │                │
  ─ ─ ─ ─ ─ ─ ─ ─ ┼ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ┘
                  │
                  └────────────────────────┐
                                           │
                                           │
                                           │
                                           │
                                           │
                                           │
                                           ▼
┌ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─
 DATABASE                                                                            │
│----------
 PostgreSQL                                                                          │
│
                                                                                     │
│
                                                                                     │
│
                                                                                     │
│
                                                                                     │
└ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─
```
