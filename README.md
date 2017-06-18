Installation:

1. `npm install`
2. create `run.sh` as described below:

run.sh should be created and should look like this:

`#!/bin/bash`

`export DASH_MAC_ADDRESS="aa:bb:cc:dd:ee:ff"`
`export DASH_PROTOCOL="udp"`
`export API_BASE="http://mysite.com"`
`export API_PATH="/path/to/api"`
`export IFACE="en0"`

`npm start`

Then you can build the image with `docker build -t some/thing .` and execute with `docker run -d --restart always --net=host some/thing`
