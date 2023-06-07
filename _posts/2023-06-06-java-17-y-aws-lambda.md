---
layout: post
title: Java 17 + AWS Lambda
date: 2023-06-06 09:07 -0700
description: AWS recently announced Java 17 support for Lambdas, In this blog post, we'll explore how to create a Java 17 AWS Lambda Function without IDE, build tool or any dependency.
lang: es-es
author: cchacin
tags: aws java java17 lambda aws-lambda
---

![Header](https://carloschac.in/public/images/java-17-aws-lambda/Header.png){:loading="lazy"}

AWS recently announced [Java 17 support for Lambdas](https://aws.amazon.com/about-aws/whats-new/2023/04/aws-lambda-java-17/), In this blog post, we'll explore how to create a Java 17 AWS Lambda Function without IDE, build tool or any dependency.

<iframe width="560" height="315" src="https://www.youtube.com/embed/VhxhmMqjEl8?sub_confirmation=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

Fist let's create the lambda function code:

```java
public class Function {

  public record Input(int x, int y) {}

  public record Output(long result) {}

  public Output add(Input input) {
    return new Output(input.x + input.y);
  }
}
```

In this example, we have an `add` method that takes an `Input` java record with 2 fields: `x` and `y`, and returns an `Output` java record with the sum of `x` and `y` assigned to the `result` field.

This is the only requirement for a AWS Lambda Function:

An instance method that takes one single parameter and returns something an object or `Void`.

That's it. Now we can proceed to compile and package our AWS Lambda Function:

Compile:

```bash
$ javac Function.java
```

Package:

```bash
$ zip function.zip *.class
```

Next, let's navigate to the AWS Lambda Console.
![2](https://carloschac.in/public/images/java-17-aws-lambda/2.png){:loading="lazy"}

Click on the `Create function` button.

![3](https://carloschac.in/public/images/java-17-aws-lambda/3.png){:loading="lazy"}

Assign a lambda name and select Java 17 as the runtime.

![4](https://carloschac.in/public/images/java-17-aws-lambda/4.png){:loading="lazy"}

Click on the `Upload from` button.

![5](https://carloschac.in/public/images/java-17-aws-lambda/5.png){:loading="lazy"}

Click `Upload` button.

![6](https://carloschac.in/public/images/java-17-aws-lambda/6.png){:loading="lazy"}

Choose the `function.zip` file that we generated.

![7](https://carloschac.in/public/images/java-17-aws-lambda/7.png){:loading="lazy"}

Click `Edit` on the `Code properties` section.

![8](https://carloschac.in/public/images/java-17-aws-lambda/8.png){:loading="lazy"}

Change the Handler to `Function::add` and click `Save`.

![9](https://carloschac.in/public/images/java-17-aws-lambda/9.png){:loading="lazy"}

Go to the `Test` tab.

![10](https://carloschac.in/public/images/java-17-aws-lambda/10.png){:loading="lazy"}

Change the JSON payload to:

```json
{
  "x": 123,
  "y": 333
}
```

Click the `Test` button, then expand the `Details` section to see the result.

![11](https://carloschac.in/public/images/java-17-aws-lambda/11.png){:loading="lazy"}

That's it! You have successfully created and tested your Java 17 AWS Lambda function. The output should be:

```json
{
  "result": 456
}
```

![12](https://carloschac.in/public/images/java-17-aws-lambda/12.png){:loading="lazy"}

This demonstrates the simplicity and power of using Java 17 with AWS Lambda. With just a few steps, you can leverage the latest Java version to build efficient and scalable serverless applications.

Feel free to explore further and unleash the full potential of Java 17 on AWS Lambda. Happy coding!
