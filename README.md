# DockerTest
This project provides a docker container, with an http and https enabled hello world api. It could be useful, if you are debugging ingress tls issues or other problems.

The image can be pushed to a local registry. This is also available as docker container.
docker run -d -p 5000:5000 --restart=always --name registry registry:2

Tag the image and prepare the push to the registry.
docker tag dockertest:latest localhost:5000/dockertest

Push it!
docker push localhost:5000/dockertest


kubectl create -f kubeDeploy.yaml
kubectl create -f services.yaml