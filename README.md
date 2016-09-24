# Building and using Einstein Toolkit Docker containers

## Overview

Docker makes it easy to set up a system configuration once, and then
use it many times on different systems. Docker has "images" and
"containers". An "image" is a snapshot of a system that is ready to be
used. Running an image, i.e. running an application that is installed
on an image, creates a "container" holding that running application.
When the container stops, it can either be discarded, or can be turned
into a new image. The original image is not modified by running it.

Thus images are static. For example, a freshly installed Ubuntu system
is available as image. Below, we create a ready-to-be-used Einstein
Toolkit install as image.

Containers, on the other hand, are dynamic, they correspond to running
Unix processes. Each Einstein Toolkit simulation runs in a container.

Containers can interact with the host system. To 

Finally, images can be easily be built from recipes called
"Dockerfiles". A Dockerfile is essentially a shell script that
contains all necessary commands to create the image from scratch.

## How to set up and run

docker build -t 'einsteintoolkit' .


IMAGE=f6477d58b757
docker commit $IMAGE et-sourcetree

docker run $IMAGE build --debug
docker run -v Cactus:/home/scientist/Cactus
