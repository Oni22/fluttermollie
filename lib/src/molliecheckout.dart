import 'package:flutter/material.dart';
import 'package:mollie/mollie.dart';
import 'package:mollie/src/mollieorder.dart';

class CheckoutStyle {
  Color buttonColor;
  TextStyle textStyle;
  AppBar appBar;

  CheckoutStyle({this.textStyle, this.buttonColor, this.appBar});
}

class MollieCheckout extends StatefulWidget {
  final bool useSofort;
  final bool useSepa;
  final bool useCredit;
  final bool usePaypal;
  final bool useIdeal;
  final bool useApplePay;
  final CheckoutStyle style;
  final MollieOrderRequest order;
  final Function(MollieOrderRequest) onMethodSelected;

  MollieCheckout(
      {
        @required this.order,
        this.style,
        this.onMethodSelected,
        this.useCredit = true,
        this.usePaypal = true,
        this.useSepa = false,
        this.useIdeal = false,
        this.useApplePay = false,
        this.useSofort = false
      });

  @override
  _MollieCheckoutState createState() => _MollieCheckoutState();
}

class _MollieCheckoutState extends State<MollieCheckout> {


  List<Widget> paymentMethods = new List();
  CheckoutStyle style;

  void _setMethod(String method) {
    widget.order.method = method;
    widget.onMethodSelected(widget.order);
  }

  void _buildPaymentMethods() {

    List<Map<String,dynamic>> paymentCodes = [
    {
      "enable": widget.useSofort,
      "method": "sofort",
      "name": "SOFORT",
      "icon": "assets/icons/klarna-sofort.png"
    },
    {
      "enable": widget.useCredit,
      "method": "creditcard",
      "name": "Credit Card",
      "icon": "assets/icons/mastercard.png"
    },
    {
      "enable": widget.usePaypal,
      "method": "paypal",
      "name": "PayPal",
      "icon": "assets/icons/paypal.png"
    },
    {
      "enable": widget.useApplePay,
      "method": "applepay",
      "name": "Apple Pay",
      "icon": "assets/icons/applepay.png"
    },
    {
      "enable": widget.useSepa,
      "method": "banktransfer",
      "name": "SEPA",
      "icon": "assets/icons/sepa.png"
    },
    {
      "enable": widget.useIdeal,
      "method": "ideal",
      "name": "iDEAL",
      "icon": "assets/icons/ideal.png"
    }
    ];

    style = widget.style == null
        ? CheckoutStyle(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text("Checkout"),
            ),
            buttonColor: Colors.black,
            textStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
        : widget.style;

    for(int i = 0; i < paymentCodes.length; i++){

      dynamic m = paymentCodes[i];

      if(m["enable"] == true){
        paymentMethods.add(Container(
            padding: const EdgeInsets.all(5),
            child: FlatButton(
                color: style.buttonColor,
                onPressed: () {
                  _setMethod(m["method"]);
                },
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      m["icon"],
                      package: "mollie",
                      width: 40,
                      height: 40,
                    ),
                    Expanded(
                        child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              m["name"],
                              style: style.textStyle,
                            ))),
                  ],
                ))));
      }

    }

  }

  @override
  void initState() {
    super.initState();
    _buildPaymentMethods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: style.appBar,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(bottom: 40, top: 40),
                  child: Text("Select a payment method.")),
              Container(
                  child: Column(
                children: paymentMethods,
              ))
            ],
          ),
        ));

    //if (widget.style != null && widget.style.appBar != null) {
    //  return Scaffold(
    //      appBar: widget.style.appBar,
    //      body: SingleChildScrollView(
    //        child: Column(
    //          children: <Widget>[
    //            Container(
    //                margin: const EdgeInsets.only(bottom: 40, top: 40),
    //                child: Text("Select a payment method.")),
    //            Container(
    //                child: Column(
    //              children: paymentMethods,
    //            ))
    //          ],
    //        ),
    //      ));
    //}
//
    //return SingleChildScrollView(
    //  child: Column(
    //    children: <Widget>[
    //      Container(
    //          margin: const EdgeInsets.only(bottom: 40, top: 40),
    //          child: Text("Select a payment method.")),
    //      Container(
    //          child: Column(
    //        children: paymentMethods,
    //      ))
    //    ],
    //  ),
    //);
  }
}
