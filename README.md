# Docker Base Image

Base image for building other base images. INCEPTION.

### Use this image from Docker Hub

In your Dockerfile reference the prebuilt image as the base

		FROM lookitsatravis/docker-base:latest

### To build the image

		$ git clone https://github.com/lookitsatravis/docker-base.git
		$ cd docker-base
		$ docker build -t docker-base .

## License

MIT
