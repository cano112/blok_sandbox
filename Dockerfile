FROM node:10-alpine

RUN apk update && \
apk upgrade && \
apk add --no-cache git cmake build-base pkgconfig fuse fuse-dev
RUN git clone https://github.com/cano112/blok.git /blok
RUN cd /blok && cmake . && cmake --build .
#RUN chmod 777 /blok/blok
#CMD ["ls", "-al", "/blok"]
RUN mkdir /examples-proxy
RUN ./blok/blok /examples /examples-proxy

ENV PATH $PATH:/node_modules/.bin

#RUN npm install https://github.com/hyperflow-wms/hyperflow/archive/master.tar.gz
#CMD ["hflow", "run", "/examples-proxy/Sqrsum"]
CMD ["ls", "-al", "/dev"]