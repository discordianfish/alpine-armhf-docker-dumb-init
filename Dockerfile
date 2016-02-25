FROM fish/alpine-armhf

RUN apk add --update -t build-deps gcc curl musl-dev \
 && curl -L https://github.com/Yelp/dumb-init/archive/master.tar.gz | tar -C /tmp -xzf - \
 && gcc -std=gnu99 -s -Wall -Werror -O3 -o /sbin/dumb-init /tmp/dumb-init-master/dumb-init.c \
 && apk del build-deps

ENTRYPOINT [ "/sbin/dumb-init" ]
