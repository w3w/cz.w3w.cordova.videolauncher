W3W Cordova 3.x.x VideoLauncher plugin
====================

Multiplatform videolauncher plugin - opens video links in assigned player without distrupting the app. The webbrowser is not reloaded as in case of normal link.



Created and completed by

- Tomáš Fejfar ([github.com/tomasfejfar](https://github.com/tomasfejfar))
- Martin Hujer ([github.com/mhujer](https://github.com/mhujer))

## Supported Platforms
- **iOS** - based on [enricodetoma / CDVVideo](https://github.com/enricodetoma/CDVVideo/)

- **Windows Phone 8**

## Using the plugin

Simply call `window.plugins.VideoLauncher(videoHref)` to open the video player.


## Adding the Plugin to your project

```
cordova plugin add https://github.com/w3w/cz.w3w.cordova.videolauncher.git
```

### iOS specific bugs

You may need to add `MediaPlayer.framework` manually to you project.
Even though it is defined in `plugin.xml` it may not get installed.
If you encounter error message saying that it can't find the `W3WVideoLauncher`
class make sure that the plugin files are part of the current target - select
each `.m` file in left XCode pane and make sure the checkbox in right pane under
`Target Membership` is checked.

## Removing the Plugin from your project

```
cordova plugin rm cz.w3w.cordova.videolauncher
```

## Release Notes
#### Version 1.0 (8.11.2013)
- [feature]: iOS support
- [feature]: WP8 support

