# USING THE PLUGIN

Now we can use the plugin.

1. First of all import the plugin
```dart
import 'package:mollie/mollie.dart';
```

2. Build your Widget and implement the MolliCheckout widget.

```dart

import 'package:mollie/mollie.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MollieCheckout(
      createOrderUrl: ...,
      order: ...,
      useCredit: true,
      usePaypal: true,
      useSepa: true,
      useSofort: true,
    );
  }
}

```

3. Add your api call to the createOrderUrl attribute

```dart
  @override
  Widget build(BuildContext context) {

    return MollieCheckout(
      createOrderUrl: "http://yourserver.herokuapp.com/your/custom/path",
      order: ...,
      useCredit: true,
      usePaypal: true,
      useSepa: true,
      useSofort: true,
    );
  }
}

```

4. Create a MollieOrderRequest and add it to the order attribute

```dart
import 'package:mollie/mollie.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  MollieOrderRequest order = new MollieOrderRequest(
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

  @override
  Widget build(BuildContext context) {

    return MollieCheckout(
      createOrderUrl: "http://yourserver.herokuapp.com/your/custom/path",
      order: order,
      useCredit: true,
      usePaypal: true,
      useSepa: true,
      useSofort: true,
    );
  }
}


```

5. Setup the redirectUrl attribute in your MollieOrderRequest.

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



6. Optionally you can enable other payment methods. PayPal and Creditcard payment is enabled by default.

Currently supported payment methods:

- CreditCard
- Paypal
- SEPA
- Klarna Sofort


# Get order data after checkout (switching back from browser to your app)

With Molli.currentMollieOrder you can get the current order object which is returned after the checkout process.
This object is alive until a new checkout process starts.

```dart

String orderId = Mollie.currentMollieOrder.id;

```



