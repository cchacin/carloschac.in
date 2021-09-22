---
layout: post
title: ☕🚢 Maven Build in < 20 lines of yaml 🕟
date: 2021-09-21 22:08 -0700
description: Automate your maven build using GitHub Actions in a simple step with less than 20 lines of yaml.
lang: en-us
author: cchacin
tags: java maven github actions github-actions build
image: /public/images/maven-github-actions/maven-build.png
---

![github-actions](/public/images/maven-github-actions/github-actions.png)

> [GitHub Actions](https://github.com/features/actions) makes it easy to automate all your software workflows, now with world-class CI/CD. Build, test, and deploy your code right from GitHub. Make code reviews, branch management, and issue triaging work the way you want.

## Create the directory

```bash
$ mkdir -p .github/workflows
```

## Create the yaml file
```bash
$ touch .github/workflows/maven.yml
```

## Copy this content

```yaml
name: Maven Build
on:
  push:
    branches:
      - main
jobs:
  build:
    name: "Maven Build"
    runs-on: ubuntu-latest
    steps:
      - name: "Checkout Sources"
        uses: actions/checkout@v2
        with:
          fetch-depth: 2
      - name: "Set up JDK"
        uses: actions/setup-java@v2
        with:
          distribution: "temurin"
          java-version: 11
          cache: "maven"
      - name: "Build with Maven"
        run: mvn verify
```

## Commit and push to Github

```bash
$ git add .github && \
  git commit -m "maven build action"
```

## Enjoy your builds

Go to the actions tab for your repository over github.com:

https://github.com/${USER}/${PROJECT}/actions/workflows/maven-build.yml

![maven-build](/public/images/maven-github-actions/maven-build.png)
