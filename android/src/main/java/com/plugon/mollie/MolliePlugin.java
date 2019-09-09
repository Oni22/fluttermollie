package com.plugon.mollie;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;

import java.util.List;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** MolliePlugin */
public class MolliePlugin implements MethodCallHandler {

  Activity activity;
  Result activeResult;
  Context context;
  Intent intent;
  private static final int REQUEST_CODE = 0x1337;

  MolliePlugin(Registrar registrar){

    activity = registrar.activity();
  }

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "mollie");
    channel.setMethodCallHandler(new MolliePlugin(registrar));

  }


  @Override
  public void onMethodCall(MethodCall call, Result result) {

    if (call.method.equals("startPayment")) {

      String checkout = call.argument("checkoutUrl");
      startPayment(checkout);
      result.success("started payment");

    }
    else {
      result.notImplemented();
    }

  }

  void startPayment(String checkoutUrl) {


    //Intent send = new Intent(Intent.ACTION_SEND);
    //send.putExtra(Intent.EXTRA_TEXT,"MY TEST");
    //send.setType("text/plain");
    //Intent share = Intent.createChooser(send,null);
    //activity.startActivity(share);
//
    //PackageManager pm = activity.getPackageManager();
    //List<ResolveInfo> activities = pm.queryIntentActivities();

    Intent browserIntent = new Intent(Intent.ACTION_VIEW, Uri.parse(checkoutUrl));
    activity.startActivity(browserIntent);

  }

}
