[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/dustinsand/pre-commit-jvm)

pre-commit-jvm
===============

A collection of git hooks for the JVM to be used with the [pre-commit framework](http://pre-commit.com).

## Requirements

pre-commit-jvm requires the following to run:

  * [pre-commit(2.8+)](http://pre-commit.com)
  * A JDK somewhere in your `PATH`, preferably with `JAVA_HOME` also set.

## Install

1. create `.pre-commit-config.yaml` in your git project
2. pre-commit install

example `.pre-commit-config.yaml`:

```yaml
- repo: https://github.com/dustinsand/pre-commit-jvm
  rev: vX.X.X
  hooks:
    - id: google-java-format
      args: [--replace, --set-exit-if-changed]
```

## Available Hooks

| Hook name              | Description                                                                                        |
| ---------------------- | -------------------------------------------------------------------------------------------------- |
| `google-java-format`   | Runs [Google Java Formatter](https://github.com/google/google-java-format) to reformat Java source code to comply with [Google Java Style](https://google.github.io/styleguide/javaguide.html). |

### Notes about the `google-java-format` hook

Minimum required arguments for the hook:

```yaml
- id: google-java-format
  args: [--replace, --set-exit-if-changed]
```

Other [CLI arguments](https://github.com/google/google-java-format) arguments are also supported. 
