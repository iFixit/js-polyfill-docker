FROM node:16-alpine

RUN apk add --no-cache --update bash
RUN apk add --no-cache --update --virtual build git python make gcc g++
WORKDIR /polyfill
ARG POLYFILL_TAG='v4.49.4'
ARG NODE_ENV='production'
RUN \
	git clone https://github.com/Financial-Times/polyfill-service . && \
	git checkout ${POLYFILL_TAG} && \
	rm -rf .git && \
	npm install -g npm@7.9.0 && \
	npm install --production=false && \
	npm run build && \
	sed -i.bak -e 's,^node,exec node,' start_server.sh && \
	mv start_server.sh /bin/ && \
	chmod a+x /bin/start_server.sh && \
	apk del build
ENV PORT 8801

EXPOSE ${PORT}

CMD ["/bin/start_server.sh", "server/index.js"]
# Use to debug if things don't start:
# CMD ["/bin/sh", "-c", "sleep 3600"]

