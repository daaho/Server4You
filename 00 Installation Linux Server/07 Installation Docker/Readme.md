# Installation Docker


## SET UP THE REPOSITORY

Install required packages. yum-utils provides the yum-config-manager utility, and device-mapper-persistent-data and lvm2 are required by the devicemapper storage driver.

~~~
$ sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
~~~

Use the following command to set up the stable repository.

~~~
$ sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
~~~


## INSTALL DOCKER ENGINE - COMMUNITY

Install the latest version of Docker Engine - Community and containerd, or go to the next step to install a specific version:
~~~
$ sudo yum install docker-ce docker-ce-cli containerd.io
~~~

## Start Docker and enable 
~~~
systemctl start docker
systemctl enable docker
Created symlink from /etc/systemd/system/multi-user.target.wants/docker.service to /usr/lib/systemd/system/docker.service.
~~~



### Verify that Docker Engine - Community is installed correctly by running the hello-world image.
~~~
docker run hello-world
~~~