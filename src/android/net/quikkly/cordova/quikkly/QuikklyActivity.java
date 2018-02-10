/**
 * Simple ScanActivity subclass to grab and marshall
 * back the scanned code(s) to the call i.e. 
 * QuikklyPlugin
 */
package net.quikkly.cordova.quikkly;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;

import net.quikkly.android.ui.ScanActivity;
import net.quikkly.core.ScanResult;
import net.quikkly.core.Tag;

import java.util.ArrayList;

public class QuikklyActivity extends ScanActivity {

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        super.setContentView(net.quikkly.android.R.layout.quikkly_scan_activity);
    }

    public void onScanResult(@Nullable ScanResult result) {

        if(result != null && !result.isEmpty()) {
            Intent intent= new Intent();
            ArrayList<String> tags = new ArrayList<>();
            for (Tag iter : result.tags) {
                tags.add(iter.getData().toString());
            }
            intent.putStringArrayListExtra(QuikklyPlugin.SCAN_CODE,
                    tags);
            setResult(Activity.RESULT_OK, intent);
            finish();
        }
    }
}
