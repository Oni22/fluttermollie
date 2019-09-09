# Flutter Mollie

A Flutter plugin for mollie payments

## Getting Started (SERVER SIDE)

Before you can start to use this plugin you have to setup your server first. Mollie's Mobile API is based on a server-client architecture because of that you have to setup a server for example with heroku.

In the following example we will use Node.js with Express.js to do our API calls.

1. After you setup your Node.js server you have to install the Mollie package. Go into your working directory and type:

```
npm install @mollie/api-client@beta --save

```

For detailed instructions go to https://github.com/mollie/mollie-api-node

2. Initialize Mollie:

```javascript

const { createMollieClient } = require('@mollie/api-client');
const mollieClient = createMollieClient({ apiKey: 'test_AFkJP7UuC3wddaeGasdG2UffGTdkmd8re'});

```

You can find your API test and public keys in your Mollie Dashboard under the developer tab.

3. Create an order:

```javascript

const { createMollieClient } = require('@mollie/api-client');
const mollieClient = createMollieClient({ apiKey: 'test_AFkJP7UuC3wddaeGasdG2UffGTdkmd8re'});

app.post("/your/custom/path",(req,res) => {

  mollieClient.orders.create(req.body).then(order => {
    res.send(order);
  }).catch(error => {
    res.send(error);
  });
});

```

## Getting Started (CLIENT SIDE)

Now we need to setup a few things for iOS and Android.

***ANDROID***

1. Setup your scheme in AndroidManifest.xml under android > app > src > main > AndroidManifest.xml. This is needed because the checkout process will be done in the browser. After the checkout is done the browser will switch back to your app.

Modify your AndroidManifest.xml like the following. Be sure that you use an unique host and scheme name. The host and scheme are important in the next steps. We use in this example "payment-return" and "molli".

```
<intent-filter>
                <data
                    android:host="payment-return"
                    android:scheme="molli" />
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
                <action android:name="android.intent.action.VIEW" />
                <category android:name="android.intent.category.DEFAULT" />
                <category android:name="android.intent.category.BROWSABLE" />
            </intent-filter>

```

Your Manifest could look like this:

```
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.plugon.mollie_example">

    <!-- io.flutter.app.FlutterApplication is an android.app.Application that
         calls FlutterMain.startInitialization(this); in its onCreate method.
         In most cases you can leave this as-is, but you if you want to provide
         additional functionality it is fine to subclass or reimplement
         FlutterApplication and put your custom class here. -->
    <application
        android:name="io.flutter.app.FlutterApplication"
        android:label="mollie_example"
        android:icon="@mipmap/ic_launcher">
        <activity
            android:name=".MainActivity"
            android:launchMode="singleTop"
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            <!-- This keeps the window background of the activity showing
                 until Flutter renders its first frame. It can be removed if
                 there is no splash screen (such as the default splash screen
                 defined in @style/LaunchTheme). -->
            <meta-data
                android:name="io.flutter.app.android.SplashScreenUntilFirstFrame"
                android:value="true" />
            <intent-filter>
                <data
                    android:host="payment-return"
                    android:scheme="molli" />
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
                <action android:name="android.intent.action.VIEW" />
                <category android:name="android.intent.category.DEFAULT" />
                <category android:name="android.intent.category.BROWSABLE" />
            </intent-filter>
        </activity>
    </application>
</manifest>


```

2. Go to your MainActivity.java in android > app > src > java > com.yourcompany.appname > MainActivity and paste the follwing into it:

```java

@Override
  protected void onNewIntent(Intent intent) {
    super.onNewIntent(intent);

    if (Intent.ACTION_VIEW.equals(intent.getAction())) {
      getFlutterView().pushRoute("paymentDone");
    }

  }

```

Change the route name to the route which you want to call after the payment process is done.

***IMPORTANT***
Currently this plugin supports only navigation with routes. Your MaterialApp() or CupertinoApp() widget should use the routes attribute to define routes. Otherwise this plugin will not process with the payment. You can ignore this step but then you have to process manually to the next step in your checkout process.

Your MainActivity could look like this:


```java

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

```




1. First of all import the plugin
```dart
import 'package:mollie/mollie.dart';
```

2. Build your Widget an implement the MolliCheckout Widget:

```dart
import 'package:mollie/mollie.dart';



```



