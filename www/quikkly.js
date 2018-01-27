var exec = require('cordova/exec');

function Quikkly() {
}

Quikkly.prototype.openScanner = function (success, error) {
    exec(success, error, 'Quikkly', 'openScanner', []);    
}

var quikkly = new Quikkly();
module.exports = quikkly;
