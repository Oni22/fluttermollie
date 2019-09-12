import 'package:flutter/material.dart';
import 'mollieorder.dart';
import 'package:intl/intl.dart';

/// Builds a list view of all orders
/// This widget is still in Alpha.
class MollieOrderStatus extends StatefulWidget {
  final List<MollieOrderResponse> orders;
  final Function() onSelectOrder;

  MollieOrderStatus({@required this.orders, this.onSelectOrder});

  _MollieOrderStatusState createState() => _MollieOrderStatusState();
}

class _MollieOrderStatusState extends State<MollieOrderStatus> {
  Color getStatusColor(String status) {
    switch (status) {
      case "created":
        return Colors.orange;
      case "pending":
        return Colors.orange;
      case "paid":
        return Colors.green;
      case "canceled":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: widget.orders.length,
          itemBuilder: (context, index) {
            MollieOrderResponse o = widget.orders[index];

            DateTime date = new DateTime.fromMillisecondsSinceEpoch(
                DateTime.parse(o.createdAt).millisecondsSinceEpoch);
            var formatter = new DateFormat("dd.MM.yyyy");
            String formattedDate = formatter.format(date);

            Color status = getStatusColor(o.status);

            return GestureDetector(
                onTap: () {
                  widget.onSelectOrder();
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
                      height: 120,
                      //padding: const EdgeInsets.all(20),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: status,
                              ),
                            ),
                            Expanded(
                                flex: 12,
                                child: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            o.products[0].name + "...",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "Status: " + o.status,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "Ordernr.: " + o.orderNumber,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "Ordered: " + formattedDate,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ],
                                    )))
                          ])),
                ));
          }),
    );
  }
}
