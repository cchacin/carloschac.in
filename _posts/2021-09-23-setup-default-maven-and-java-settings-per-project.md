---
layout: post
title: 🏆 Default 🔗 Maven and ☕ Java settings per project
date: 2021-09-22 23:00 -0700
description: Almost every single project requires some specific options for Maven and Java, like memory, profiles, etc., and we are going to see how to set up those per project in a few easy steps.
lang: en-us
author: cchacin
tags: java maven settings configuration setup
image: /public/images/maven-config/tree.png
---

![github-actions](/public/images/maven-config/tree.png){:loading="lazy"}

I generally use many different options on maven projects to set up things like memory lower and upper limits, fail at the end, the process in batch, use x number of threads, etc. In addition to this, sometimes I need to pass flags to the JVM like add modules, garbage collector flags, etc., and it is difficult to remember and also error-prone to have something like this:

```bash
$ JAVA_OPTS="-Xms512m -Xmx1024m -Djava.awt.headless=true" \
  mvn -B -T 4 -fae -P ci verify
```

or even worst with the extended version of the flags:

```
$ JAVA_OPTS="-Xms512m -Xmx1024m -Djava.awt.headless=true" \
mvn --batch-mode --threads 4 -fail-at-end --activate-profiles ci verify
```

Fortunately for us, since maven 3.3.1, we now can setup this per project, including the flags in these two files relatives to the project directory:

<!-- more -->

`.mvn/maven.config` with:

```bash
-B -T 4 -fae -P ci
```

`.mvn/jvm.config` with:

```bash
-Xms512m -Xmx1024m -Djava.awt.headless=true
```

Now, all we need to do is run the maven command, and the settings in the files will be honored:

```bash
$ mvn verify
```
