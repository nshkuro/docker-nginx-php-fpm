## Summary
This is a Dockerfile to build a container image for nginx and php-fpm.

## Installation
Pull the image from the docker hub.

```
docker pull nshkuro/nginx-php-fpm:latest
```

## Running
To simply run the container:

```
sudo docker run --name web -p 80:80 -d nshkuro/nginx-php-fpm
```
### Volumes
If you want to link  your website code directory to the docker host:

```
sudo docker run --name web -p 80:80  -v /your_CODE_directory:/var/www -d nshkuro/nginx-php-fpm
```
