import 'package:flutter/material.dart';
import 'mollieorder.dart';
import 'package:intl/intl.dart';

import 'mollieproduct.dart';

/// Builds a list view of all orders
class MollieOrderStatus extends StatefulWidget {
  final List<MollieOrderResponse> orders;
  final Function(MollieOrderResponse) onSelectOrder;

  MollieOrderStatus({@required this.orders, this.onSelectOrder});

  _MollieOrderStatusState createState() => _MollieOrderStatusState();
}

class _MollieOrderStatusState extends State<MollieOrderStatus> {


  List<String> orderStatus = [
    "Created","Pending","Paid","Shipped"
  ];

  Widget shippmentProcess(String status) {

    int statusIndex = -1;

    switch (status) {
      case "created":
        statusIndex = 0;
        break;
      case "pending":
        statusIndex = 1;
        break;
      case "paid":
        statusIndex = 2;
        break;
      case "shipped":
        statusIndex = 3;
    }

    List<Widget> container = new List();

    for(int i = 0; i < orderStatus.length; i++){

      container.add(Expanded(
        flex: 3,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Text(orderStatus[i]),
              ),
              Expanded(
                child: Container(
                color: statusIndex >= i ? Colors.blue : Colors.grey,
              ))
            ],
          ),
        ),
      ));

    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: container,
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Orders"),
      ),
      body: ListView.builder(
          itemCount: widget.orders.length,
          itemBuilder: (context, index) {

            MollieOrderResponse o = widget.orders[index];

            DateTime date = new DateTime.fromMillisecondsSinceEpoch(
                DateTime.parse(o.createdAt).millisecondsSinceEpoch);
            var formatter = new DateFormat("dd.MM.yyyy");
            String formattedDate = formatter.format(date);

            int items = 0;

            for(MollieProductResponse p in o.products){

              items += p.quantity;

            }
            
            return GestureDetector(
                onTap: () {
                  widget.onSelectOrder(o);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 1,
                            spreadRadius: 2,
                            offset: Offset(1, 1))
                      ]),
                      width: MediaQuery.of(context).size.width,
                      height: 140,
                      //padding: const EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(right: 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Order No",style: TextStyle(fontWeight: FontWeight.bold),),
                                      Text(o.orderNumber)
                                    ],
                                  )
                                ),
                                Container(
                                    margin: const EdgeInsets.only(right: 15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Amount",style: TextStyle(fontWeight: FontWeight.bold),),
                                        Text(o.amount.value)
                                      ],
                                    )
                                ),
                                Container(
                                    margin: const EdgeInsets.only(right: 15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Items",style: TextStyle(fontWeight: FontWeight.bold),),
                                        Text(items.toString())
                                      ],
                                    )
                                )
                              ],
                            )
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            alignment: Alignment.centerLeft,
                            child: Text("Order placed on " + formattedDate),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            alignment: Alignment.centerLeft,
                            child: Text("Status: " + o.status,style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.green,
                              padding: const EdgeInsets.all(5),
                              child: shippmentProcess(o.status),
                          ))

                        ],
                      )),
                ));
          }),
    );
  }
}
