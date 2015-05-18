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
If you want to link to your web site directory and your virtual host configs on the docker host to the container run:
(Just for example, please make sure that your vhost config and root path to code is correct)
```
sudo docker run --name web -p 80:80 -v /your_CONFIG_directory:/etc/nginx/sites-enabled -v /your_CODE_directory:/var/www -d nshkuro/nginx-php-fpm
```
