# USING THE PLUGIN

Now we can use the plugin.

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


**4. Call your api endpoint and send your MollieOrderRequest to your server to retrieve an order object:**

```dart

  Future<void> createOrder(MollieOrderRequest order) async{

    /// send a POST request to your server with the created MollieOrderRequest
    var orderResponse = await http.post(
        "http://blackboxshisha.herokuapp.com/mollie/create/order",
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
    );
  }

```


**6. Optionally you can enable other payment methods. PayPal and Creditcard payment is enabled by default.**

Currently supported payment methods:

- CreditCard
- Paypal
- SEPA
- Klarna Sofort


PROFIT! :)