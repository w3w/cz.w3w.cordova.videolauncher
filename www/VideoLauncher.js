var exec = require('cordova/exec');

module.exports = function(videoUrl, callback, errback) {
    callback = callback || function(){};
    errback = errback || function(){};
    exec(callback, errback, 'VideoLauncher', 'launch', [videoUrl]);
};
