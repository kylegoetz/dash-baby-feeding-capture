# Note will want to pass in environment variables:
# DASH_MAC_ADDRESS, IFACE, DASH_PROTOCOL, API_BASE
# Will invoke with --net=host as well so it will be able to detect
# and restart always

FROM node:7
WORKDIR /app
ADD . ./

RUN apt-get update && \
	apt-get install -y libpcap-dev && \
	cd /app && \
	npm install

CMD ["./run.sh"]
