#!/bin/bash

containerID=$(sudo docker run -d magnetikonline/buildmozjpeg)
sudo docker cp $containerID:/root/build/mozjpeg-3.1/build/mozjpeg_3.1-1_amd64.deb .
sleep 1
sudo docker rm $containerID
