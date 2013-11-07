using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Phone.Tasks;
using WPCordovaClassLib.Cordova;
using WPCordovaClassLib.Cordova.Commands;
using WPCordovaClassLib.Cordova.JSON;

namespace Cordova.Extension.Commands
{
    class W3WVideoLauncher : BaseCommand
    {
        public void launch(string options)
        {
            string url = JsonHelper.Deserialize<string[]>(options)[0];

            MediaPlayerLauncher mediaPlayerLauncher = new MediaPlayerLauncher();

            mediaPlayerLauncher.Media = new Uri(url, UriKind.Absolute);
            mediaPlayerLauncher.Location = MediaLocationType.Data;
            mediaPlayerLauncher.Controls = MediaPlaybackControls.All;
            mediaPlayerLauncher.Orientation = MediaPlayerOrientation.Landscape;

            mediaPlayerLauncher.Show();
        }
    }
}
