var exec = require('cordova/exec');

function QuikklyPlugin () {
}

QuikklyPlugin.prototype.openScanner = function (apiKey, success, error) {
    exec(success, error, 'QuikklyPlugin', 'openScanner', [apiKey]);
};

var quikkly = new QuikklyPlugin();
module.exports = quikkly;
