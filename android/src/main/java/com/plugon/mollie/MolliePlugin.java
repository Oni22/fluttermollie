package com.plugon.mollie;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/**
 * MolliePlugin
 */
public class MolliePlugin implements FlutterPlugin, MethodCallHandler {

    private Context context;

    @Override
    public void onMethodCall(MethodCall call, @NonNull Result result) {
        if (call.method.equals("startPayment")) {
            String checkout = call.argument("checkoutUrl");
            startPayment(checkout);
            result.success("started payment");
        } else {
            result.notImplemented();
        }
    }

    void startPayment(String checkoutUrl) {
        Intent browserIntent = new Intent(Intent.ACTION_VIEW, Uri.parse(checkoutUrl));
        context.startActivity(browserIntent);
    }

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        final MethodChannel channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "mollie");
        channel.setMethodCallHandler(this);
        context = flutterPluginBinding.getApplicationContext();
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        context = null;
    }
}
