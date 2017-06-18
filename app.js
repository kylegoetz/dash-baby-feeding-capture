const { DASH_MAC_ADDRESS, DASH_PROTOCOL, IFACE, API_BASE, API_PATH } = require('./config');
console.log('ENV vars:', require('./config'));
const dashButton = require('node-dash-button');
const request = require('request-json').createClient(API_BASE);
const URL_SAFE_DASH_MAC_ADDRESS = DASH_MAC_ADDRESS.replace(/:/g, '');

const dash = dashButton(DASH_MAC_ADDRESS, IFACE, 5000, DASH_PROTOCOL);
dash.on('detected', () => {
	//send info to API
	const data = null;
	console.info(`${API_PATH}/clicks/${URL_SAFE_DASH_MAC_ADDRESS}`);
	request.post(`${API_PATH}/clicks/${URL_SAFE_DASH_MAC_ADDRESS}`, data, (err, res, body) => {
		if(  err  ) {
			console.error(err);
			return;
		}
		console.log('Success', body);
	});
});
