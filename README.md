# nginx-server-101
--

## Usage

### Build

```
docker build -t mitchallen/nginx-react-server .
```

This example runs the server locally on port 1280.

    docker run -p 1290:80 --name nginx-react-server mitchallen/nginx-react-server


* * *

### Rerun with the same or a new container

```
docker stop nginx-server
docker rm nginx-server
docker run -p 1290:80 --name nginx-server mitchallen/nginx-react-server
```

* * *

### Confirm image is running

    docker ps
    
* * *


### Running Multiple Containers

You can run multiple containers on multiple ports like this:

```
docker run -p 1291:80 --name react1 mitchallen/nginx-react-server

docker run -p 1292:80 --name react2 mitchallen/nginx-react-server
``` 

Each server should have a unique set of values.

* * *

### Start and stop a running container

    docker stop nginx-react-server
    docker stop react1
    docker stop react2

    docker start nginx-react-server
    docker start react1
    docker start react2
    
* * *

### Remove

#### Remove Container

    docker stop nginx-server
    docker rm nginx-server

### Remove Image

    docker stop nginx-react-server
    docker rm nginx-react-server
    docker rmi mitchallen/nginx-react-server

* * *