package cz.w3w.cordova.plugin.videolauncher;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.content.Intent;
import android.net.Uri;


import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;

public class VideoLauncher extends CordovaPlugin {
	
	private CallbackContext callbackContext;

	@Override
	public boolean execute (String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
		JSONObject r = new JSONObject();
		try
		{
			String uriString = args.getString(0);
			Intent intent = new Intent(Intent.ACTION_VIEW);
			intent.setDataAndType(Uri.parse(uriString), "video/*");

			cordova.getActivity().startActivity(intent); 
		}
		catch (JSONException e) {
			e.printStackTrace();
			callbackContext.error(r);
			return false;
		}

		this.callbackContext = callbackContext;
		return true;
	}


	@Override
	public void onActivityResult(int reqCode, int resultCode, Intent data) {
		this.callbackContext.success();
	}
}
