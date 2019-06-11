#!/usr/bin/env bash

echo "Build Images..."
sudo docker login -u $username -p $password registry.cn-hangzhou.aliyuncs.com
sudo docker build -f ./dockerfiles/gpu.Dockerfile -t registry.cn-hangzhou.aliyuncs.com/geekcloud/tf-gpu-py3:latest .
echo "Push Images..."
sudo docker push registry.cn-hangzhou.aliyuncs.com/geekcloud/tf-gpu-py3:latest
sudo docker logout
