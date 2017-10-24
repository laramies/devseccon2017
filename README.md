# devseccon2017

Supporting material for the workshop. First clone this repository and make sure you have Docker installed (www.docker.com)

In order to run the docker image with the Jupyter Notebook, first you need to pull the docker image created for this purpose:

-docker pull laramies/alpine:devseccon

Once the image is downloaded, run the container with the following command from:

-docker run -p 8888:8888 -v \`pwd\`/workdir:/opt laramies/alpine:devseccon

Finally point your browser to http://localhost:8888

![alt text](https://github.com/laramies/devseccon2017/raw/master/mydashboard.png)



