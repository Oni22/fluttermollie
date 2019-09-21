# USING THE PLUGIN


The MollieCheckout widget works with the client method and the client-server method.
We will show you both implementations. If you want to use the client method step over this
step an go to **"Getting started to use the plugin"**.


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

### Getting started to use the plugin

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