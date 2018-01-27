package com.quikkly.cordova.quikkly;

import android.app.Activity;
import android.content.Intent;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.json.JSONArray;
import org.json.JSONException;

import java.util.ArrayList;

public class Quikkly extends CordovaPlugin {

    private static final int SCAN_ACTIVITY = 100;
    public static final String SCAN_CODE = "scanCode";

    private volatile CallbackContext callbackContext = null;

    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        super.initialize(cordova, webView);
        net.quikkly.android.Quikkly.configureInstance(
                cordova.getActivity().getApplicationContext(),
                4,
                8);
    }

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals("openScanner")) {
            this.openScanner(callbackContext);
            return true;
        }
        return false;
    }

    private void openScanner(CallbackContext callbackContext) {
        Intent intent = new Intent(
                cordova.getActivity().getApplicationContext(),
                QuikklyActivity.class);

        this.callbackContext = callbackContext;
        this.cordova.startActivityForResult(this, intent, SCAN_ACTIVITY);
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent intent) {
        super.onActivityResult(requestCode, resultCode, intent);
        switch (requestCode) {
            case SCAN_ACTIVITY: {
                if (resultCode == Activity.RESULT_OK) {
                    if (callbackContext != null) {
                        JSONArray array = new JSONArray();
                        ArrayList<String> tags = intent.getStringArrayListExtra(SCAN_CODE);
                        for(String iter : tags) {
                            array.put(iter);
                        }
                        callbackContext.success(array);
                    }
                }
                break;
            }
        }
    }
}
