var exec = require('cordova/exec');

module.exports = function(videoUrl, callback, errback) {
    exec(callback, errback, 'VideoLauncher', 'launch', [videoUrl]);
};
