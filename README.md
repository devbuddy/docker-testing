# Docker image for the tests of DevBuddy

The goal of this image is to speed up the start of CI flows in https://github.com/devbuddy/devbuddy.

## Trigger a new build

```bash
$ git commit
$ git push

...

$ git tag v1.0
$ git push --tags
```

## Usage

Image: `devbuddy/docker-testing:1.0`
