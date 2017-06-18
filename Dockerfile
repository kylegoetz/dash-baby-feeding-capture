# Note will want to pass in environment variables:
# DASH_MAC_ADDRESS, IFACE, DASH_PROTOCOL, API_BASE
# Will invoke with --net=host as well so it will be able to detect
# and restart always

FROM node:7-alpine

ADD ./run.sh /app/run.sh

RUN apk update && \
	apk add libpcap && \
	apk add libpcap-dev && \
	apk add git && \
	apk add python && \
	apk add make && \
	apk add g++ && \
	mkdir /app && \
	cd /app && \
	git clone https://git .

WORKDIR /app

CMD ["run.sh"]
