
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'mollie.dart';
import 'mollieorder.dart';

class CheckoutStyle {
  Color buttonColor;
  TextStyle textStyle;

  CheckoutStyle({this.textStyle,this.buttonColor});
}

class MollieCheckout extends StatefulWidget{

  final bool useSofort;
  final bool useScaffold;
  final bool useSepa;
  final bool useCredit;
  final bool usePaypal;
  final CheckoutStyle style;
  final MollieOrderRequest order;
  final String createOrderUrl;
  final Function(String) onMethodSelected;

  MollieCheckout({
    @required this.createOrderUrl,
    @required this.order,
    this.style,
    this.useScaffold = true,
    this.onMethodSelected,
    this.useCredit = true,
    this.usePaypal = true,
    this.useSepa = false,
    this.useSofort = false
  });

  @override
  _MollieCheckoutState createState() => _MollieCheckoutState();

}

class _MollieCheckoutState extends State<MollieCheckout> {


  List<Widget> paymentMethods = new List();

   Future<void> _createOrder(String method) async {

    widget.order.method = method;
    String body = widget.order.toJson();

    var res = await http.post(widget.createOrderUrl,
        headers: {"Content-Type": "application/json"},
        body: body);

    MollieOrderResponse response = MollieOrderResponse.build(json.decode(res.body));

    await Mollie.startPayment(response.checkoutUrl);

  }

  void _buildPaymentMethods() {

    CheckoutStyle style = widget.style == null ?
    CheckoutStyle(buttonColor: Colors.black,textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)) : widget.style;


    if(widget.useCredit){
      paymentMethods.add(
        Container(
          padding: const EdgeInsets.all(5),
          child: FlatButton(
              color: style.buttonColor,
              onPressed: () {
                _createOrder("creditcard");
              },
              child: Row(
                children: <Widget>[
                  Image.asset("assets/icons/mastercard.png",package: "mollie",width: 40,height: 40,),
                  Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text("Creditcard",style: style.textStyle,)
                      )
                  ),
                ],
              )
          )
        )
      );
    }

    if(widget.useSofort){
      paymentMethods.add(
          Container(
              padding: const EdgeInsets.all(5),
              child: FlatButton(
                  color: style.buttonColor,
                  onPressed: () {
                    _createOrder("sofort");
                  },
                  child: Row(
                    children: <Widget>[
                      Image.asset("assets/icons/klarna-sofort.png",package: "mollie",width: 40,height: 40,),
                      Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              child: Text("Sofort",style: style.textStyle,)
                          )
                      ),
                    ],
                  )
              )
          )
      );
    }


    if(widget.useSepa){
      paymentMethods.add(
          Container(
              padding: const EdgeInsets.all(5),
              child: FlatButton(
                  color: style.buttonColor,
                  onPressed: () {
                    _createOrder("sepadirectdebit");
                  },
                  child: Row(
                    children: <Widget>[
                      Image.asset("assets/icons/sepa.png",package: "mollie",width: 40,height: 40,),
                      Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              child: Text("SEPA",style: style.textStyle,)
                          )
                      ),
                    ],
                  )
              )
          )
      );
    }

    if(widget.usePaypal){
      paymentMethods.add(
          Container(
              padding: const EdgeInsets.all(5),
              child: FlatButton(
                  color: style.buttonColor,
                  onPressed: () {
                    _createOrder("paypal");
                  },
                  child: Row(
                    children: <Widget>[
                      Image.asset("assets/icons/paypal.png",package: "mollie",width: 40,height: 40,),
                      Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              child: Text("PayPal",style: style.textStyle,)
                          )
                      ),
                    ],
                  )
              )
          )
      );
    }

  }

  @override
  void initState() {
    super.initState();
    _buildPaymentMethods();
  }

  @override
  Widget build(BuildContext context) {

    if(widget.useScaffold){

      return Scaffold(
        appBar: AppBar(
          title: Text("Checkout"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(bottom: 40,top: 40),
                    child: Text("Select a payment method.")
                ),
                Container(
                    child: Column(
                      children: paymentMethods,
                    )
                )
              ],
            ),
          )
      );

    }

    return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(bottom: 40,top: 40),
                  child: Text("Select a payment method.")
              ),
              Container(
                  child: Column(
                    children: paymentMethods,
                  )
              )
            ],
          ),
    );

  }

}