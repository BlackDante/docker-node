# Docker Node

Using docker for node, express app.

## ENV

 - Install Docker: https://docs.docker.com/engine/installation/

## Usage

### Build docker image

```Bash
$ docker build -t dante/node:0.1 .
```

### Run in console

```Bash
$ docker run -i -t -p 8080:8080 dante/node:0.1
```

### Run in background

```Bash
$ docker run -d -p 8080:8080 dante/node:0.1
```

### Check all availables docker images

```Bash
$ docker images
```

### Check all running docker images

```Bash
$ docker ps
```
