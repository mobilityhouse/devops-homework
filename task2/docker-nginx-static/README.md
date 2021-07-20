# ABOUT: 

The docker image is based on alpine base image. Nginx has been compiled from source and the static html page has been served by nginx with root directory as /opt/html. 
The motivation to use alpine is to create a minimalist docker image which is small in size and is easy to ship. 

# BUILD: 

The image can be build with following docker command: 

```
docker build -t nginx:1 .
```


# RUN: 

The image once build can be run with following docker command:

```
docker run  -p 8080:80 nginx:1 
```

Once the container is up and running, the thus served application can be viewed on exposed port 8080 by typing http://localhost:8080 in browser.


