import 'package:flutter/material.dart';
import 'package:movil181/app/domain/models/models.dart';

class OrdersCard extends StatelessWidget {
  final Orders order;

  const OrdersCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 7.5),
                  blurRadius: 10,
                )
              ]),
          child: Stack(
            children: [
              _ProductDetails(order),
              Positioned(
                  bottom: 50,
                  left: 40,
                  child: Row(
                    children: [
                      Text('Tienda: ', style: textTheme.headline6),
                      Text(
                        order.tienda,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              Positioned(
                  bottom: 15,
                  left: 40,
                  child: Row(
                    children: [
                      Text('Total: \$ ', style: textTheme.headline5),
                      Text(order.precio.toString(),
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
            ],
          )),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final Orders order;

  const _ProductDetails(this.order);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 70),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          width: double.infinity,
          height: 37,
          decoration: BoxDecoration(
              color: Colors.teal[300],
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.referencia,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )),
    );
  }
}
