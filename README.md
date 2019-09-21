# Flutter Mollie

A Flutter plugin for mollie payments

## NEWS

With version 0.8.0 the Mollie plugin supports client requests directly from your app.
This feature is currently in beta.

Currently supported APIs:

- Orders API
- Customers API
- Subscription API
- Payment API


## ROADMAP

Adding support for client calls for the following APIs:

- Shipment API
- Invoice API
- Chargebacks API
- Refunds API


## Getting started

Before you can use the plugin you have to setup a few things to implement the browser switch for iOS and Android:

***ANDROID***

**1. Setup your scheme in AndroidManifest.xml under android > app > src > main > AndroidManifest.xml. This is needed because if the user starts the checkout process this plugin will switch to the browser and will open the checkout page of Mollie. After the checkout is done the browser will switch back to your app. The scheme will help the browser to open the correct app.**

Modify your AndroidManifest.xml like the following. Be sure that you use an unique host and scheme name. The host and scheme are important in the next steps. We will use "payment-return" as host and "mollie" as scheme in this example.

```
<intent-filter>
     <data
       android:host="payment-return"
       android:scheme="mollie" />
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

**2. Go to your MainActivity.java in android > app > src > java > com.yourcompany.appname > MainActivity and paste the follwing into it:**

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
      getFlutterView().pushRoute("paymentDone");
    }

  }
}

```


***iOS***

**1. Open your AppDelegate.swift in xCode and past this into it:**

```swift

 override func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey :   Any] = [:]) -> Bool {
        if (url.host! == "payment-return") {

            let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
            controller.pushRoute("paymentDone");

            return true;
        }

        return false;
    }

```

Be sure that the "payment-return" part equals your android:host in your AndroidManifest.xml.

***IMPORTANT***
Currently this plugin supports only navigation with routes. Your MaterialApp() or CupertinoApp() widget should use the routes attribute to define routes. Otherwise this plugin will not process with the payment. You can ignore this step but then you have to process manually to the next step in your checkout process.


**2. Go to your Info.plist file. Right click any blank area and select Add Row to create a new key. (This part is from molli: https://docs.mollie.com/mobile-apps/getting-started-payments)**

![alt text](https://assets.docs.mollie.com/_images/ios-scheme_plist-1@2x.png)

You’ll be prompted to select a key from a drop-down menu. Scroll to the bottom and select URL types. This creates an array item. You can further click the disclosure icon to expand it and you need to select Item 0. Expand that row as well and you should see URL identifier. Double-click the value field and fill in your identifier. Most of the time will this be the same as your bundle ID, e.g. com.mollie.MollieApp. Click on the plus-button next to Item 0 and choose URL Schemes from the drop-down menu. Expand the URL Schemes row and another Item 0 will show up. Type in the value-field the scheme you want to handle, in our case mollie-app. Make sure to pick a unique scheme.

![alt text](https://assets.docs.mollie.com/_images/ios-scheme_plist-2@2x.png)



# USING THE PLUGIN


The MollieCheckout widget works with the client method and the client-server method.
We will show you both implementations.

If you want to use the client method step over this step an go to "Getting started to use the plugin".

** If you are using client-server architecture **

If you are using a client-server architecture you have to setup your server first for example with heroku.
In the following example we will use Node.js with Express.js to do our API calls.

**1. After you setup your Node.js server you have to install the Mollie package. Go into your working directory and type:**

```
npm install @mollie/api-client@beta --save

```

For detailed instructions go to https://github.com/mollie/mollie-api-node

**2. Initialize Mollie:**

```javascript

const { createMollieClient } = require('@mollie/api-client');
const mollieClient = createMollieClient({ apiKey: 'test_AFkJP7UuC3wddaeGasdG2UffGTdkmd8re'});

```

You can find your API test and public keys in your Mollie Dashboard under the developer tab.

**3. Create an order:**

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

** Getting started to use the plugin **

**1. Import the plugin**
```dart
import 'package:mollie/mollie.dart';
```

**2. Create a new MollieOrderRequest:**

```dart

MollieOrderRequest requestOrder = new MollieOrderRequest(
      amount: MollieAmount(
          value: "1396.00",
          currency: "EUR"
      ),
      orderNumber: "900",
      redirectUrl: "mollie://payment-return",
      locale: "de_DE",
      webhookUrl: 'https://example.org/webhook',
      billingAddress: new MollieAddress(
        organizationName: 'Mollie B.V.',
        streetAndNumber: 'Keizersgracht 313',
        city: 'Amsterdam',
        region: 'Noord-Holland',
        postalCode: '1234AB',
        country: 'DE',
        title: 'Dhr.',
        givenName: 'Piet',
        familyName: 'Mondriaan',
        email: 'piet@mondriaan.com',
        phone: '+31309202070',
      ),
      shippingAddress: new MollieAddress(
        organizationName: 'Mollie B.V.',
        streetAndNumber: 'Keizersgracht 313',
        city: 'Amsterdam',
        region: 'Noord-Holland',
        postalCode: '1234AB',
        country: 'DE',
        title: 'Dhr.',
        givenName: 'Piet',
        familyName: 'Mondriaan',
        email: 'piet@mondriaan.com',
        phone: '+31309202070',
      ),
      products: [
        MollieProductRequest(
          type: 'physical',
          sku: '5702016116977',
          name: 'LEGO 42083 Bugatti Chiron',
          productUrl: 'https://shop.lego.com/nl-NL/Bugatti-Chiron-42083',
          imageUrl: 'https://sh-s7-live-s.legocdn.com/is/image//LEGO/42083_alt1?',
          quantity: 2,
          vatRate: '21.00',
          unitPrice: MollieAmount(
            currency: 'EUR',
            value: '399.00',
          ),
          totalAmount: MollieAmount(
            currency: 'EUR',
            value: '698.00',
          ),
          discountAmount: MollieAmount(
            currency: 'EUR',
            value: '100.00',
          ),
          vatAmount: MollieAmount(
            currency: 'EUR',
            value: '121.14',
          ),
        ),
        MollieProductRequest(
          type: 'physical',
          sku: '5702016116977',
          name: 'LEGO 42083 Bugatti Chiron',
          productUrl: 'https://shop.lego.com/nl-NL/Bugatti-Chiron-42083',
          imageUrl: 'https://sh-s7-live-s.legocdn.com/is/image//LEGO/42083_alt1?',
          quantity: 2,
          vatRate: '21.00',
          unitPrice: MollieAmount(
            currency: 'EUR',
            value: '399.00',
          ),
          totalAmount: MollieAmount(
            currency: 'EUR',
            value: '698.00',
          ),
          discountAmount: MollieAmount(
            currency: 'EUR',
            value: '100.00',
          ),
          vatAmount: MollieAmount(
            currency: 'EUR',
            value: '121.14',
          ),
        )
      ]

  );


```


**3. IMPORTANT Setup the redirectUrl attribute in your MollieOrderRequest.**

```dart

 MollieOrderRequest order = new MollieOrderRequest(
      ...
      redirectUrl: "mollie://payment-return",
      ...
);

```

The redirectUrl should follow this pattern scheme://host. For our example it should be mollie://payment-return.

Cheat Sheet:

(We use mollie and payment-return in this example)

File | Scheme | Host | RedirectUrl
--- | --- | --- | ---
AndroidManifest | android:scheme="mollie"  | android:host="payment-return"| mollie://payment-return
Info.plist   | URL Schemes -> item0 -> "mollie" | Set up "payment-return" in AppDelegate.swift (see top)| mollie://payment-return


**4. Call your api endpoint or use the client instance to send your MollieOrderRequest to the server to retrieve an order object:**

For client-server architecture:

```dart

  Future<void> createOrder(MollieOrderRequest order) async{

    /// send a POST request to your server with the created MollieOrderRequest
    var orderResponse = await http.post(
        "http://yourserver.herokuapp.com/mollie/create/order",
        headers: {"Content-Type": "application/json"},
        body: order.toJson()
    );

    /// get a order object from your server and parse it
    var data = json.decode(orderResponse.body);
    MollieOrderResponse res = MollieOrderResponse.build(data);

    /// set the current order to retrieve this order from other widgets easily with Mollie.getCurrentOrder()
    Mollie.setCurrentOrder(res);

    /// Start the checkout process with the browser switch
    Mollie.startPayment(res.checkoutUrl);

  }

```

For calling directly from client. The client.init() function has to be called only once:

```dart

  Future<void> createOrder(MollieOrderRequest order) async{

    client.init("test_TUIAGS980q2ezahdoas");

    var createdOrder = await client.orders.create(order);

    /// set the current order to retrieve this order from other widgets easily with Mollie.getCurrentOrder()
    Mollie.setCurrentOrder(createdOrder);

    /// Start the checkout process with the browser switch
    Mollie.startPayment(createdOrder.checkoutUrl);

  }

```

**5. Use the MollieCheckout widget to show nicely multiple payment methods:**

```dart

   @override
  Widget build(BuildContext context) {
    return MollieCheckout(
      order: requestOrder,
      onMethodSelected: (order) {

        createOrder(order);

      },
      useCredit: true,
      usePaypal: true,
      useSepa: true,
      useSofort: true,
      useIdeal: true,
      useApplePay: true
    );
  }
  
```


**6. Optionally you can enable other payment methods. PayPal and Creditcard payment is enabled by default.**

Currently supported payment methods:

- CreditCard
- Paypal
- SEPA
- Klarna Sofort
- Apple Pay
- iDEAL


PROFIT! :)



