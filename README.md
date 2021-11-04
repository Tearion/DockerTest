# HelloWorldAPIWithTLS
This project provides a docker container with a http and https enabled hello world api. It could be useful, if you are debugging ingress tls issues or other problems.

The image can be pushed to a local registry. This is also available as docker container.
<pre><code>docker run -d -p 5000:5000 --restart=always --name registry registry:2</pre></code>

Tag the image and prepare the push to the registry.
<pre><code>
docker tag dockertest:latest localhost:5000/dockertest
</pre></code>
Push it!
<pre><code>
docker push localhost:5000/dockertest
</pre></code>

Now create a deployment and a service on kubernetes.
<pre><code>
kubectl create -f kubeDeploy.yaml
kubectl create -f services.yaml
</pre></code>

The container should now be online and available throu these adress:
<pre><code>
http://localhost:4711 for HTTP
https://localhost:4712 for HTTPS
</pre></code>


The container is also available on https://hub.docker.com/r/tearion/helloworldapiwithtls
