package com.plugon.mollie_example;

import android.content.Intent;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;


public class MainActivity extends FlutterActivity {

    @Override
    protected void onNewIntent(@NonNull Intent intent) {
        super.onNewIntent(intent);
        if (Intent.ACTION_VIEW.equals(intent.getAction())) {
            FlutterEngine flutterEngine = getFlutterEngine();
            if (flutterEngine != null) {
                flutterEngine.getNavigationChannel().pushRoute("done");
            }
        }
    }
}
