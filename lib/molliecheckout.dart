
import 'package:flutter/material.dart';

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
  final Function(String) onMethodSelected;

  MollieCheckout({
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
  
  void setMethod(String method){
    widget.onMethodSelected(method);
  }

  void buildPaymentMethods() {

    CheckoutStyle style = widget.style == null ?
    CheckoutStyle(buttonColor: Colors.black,textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)) : widget.style;


    if(widget.useCredit){
      paymentMethods.add(
        Container(
          padding: const EdgeInsets.all(5),
          child: FlatButton(
              color: style.buttonColor,
              onPressed: () {
                setMethod("creditcard");
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
                    setMethod("sofort");
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
                    setMethod("sepadirectdebit");
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
                    setMethod("PayPal");
                  },
                  child: Row(
                    children: <Widget>[
                      Image.asset("assets/icons/paypal.png",package: "mollie",width: 40,height: 40,),
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

  }

  @override
  void initState() {
    super.initState();
    buildPaymentMethods();
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