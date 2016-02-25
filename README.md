# alpine-armhf-docker-dumb-init
alpine-armhf-docker image with [dumb-init](https://github.com/Yelp/dumb-init)
installed and used as default ENTRYPOINT.

## Rational
You might have read that you should never run multiple processes in
a Docker container. This is true as a rule of thumb, but there are
exceptions.

To decide what to run in a container and what to run in another
container it's more important to look at logical boundaries than the
number of processes.

If you application X needs some "sidecar" process, you need to run it
next to your application. Kubernetes supports [Pods](http://kubernetes.io/v1.1/docs/user-guide/pods.html)
for this, which is usually the way to go and should be prefered over
running multiple processes in a single container.

But if you don't run Kubernetes, it's often better to just run multiple
processes in a single container. This is where this image comes in
handy. Here specifically we want to run multiple processes in one
container since the target are embedded system with constraint
resources.

You can use this image like you would use any other base image, just
don't override ENTRYPOINT or run `dumb-init` yourself.
