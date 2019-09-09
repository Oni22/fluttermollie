package com.plugon.mollie_example;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;

import io.flutter.Log;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

  boolean isSuccess;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
  }


  @Override
  protected void onNewIntent(Intent intent) {
    super.onNewIntent(intent);

    if (Intent.ACTION_VIEW.equals(intent.getAction())) {
      getFlutterView().pushRoute("done");
    }

  }
}
