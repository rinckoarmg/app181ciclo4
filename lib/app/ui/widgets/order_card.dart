import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
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
                  bottom: 45,
                  left: 40,
                  child: Row(
                    children: [
                      Text('Tienda: ', style: textTheme.headline5),
                      Text(
                        order.tienda,
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              Positioned(
                  bottom: 10,
                  left: 40,
                  child: Row(
                    children: [
                      Text('Total: \$ ', style: textTheme.headline4),
                      Text(order.precio.toString(),
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
            ],
          )),
    );
  }
}

// class _CategorieIcon extends StatelessWidget {
//   final String? innerImage;

//   const _CategorieIcon(this.innerImage);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FittedBox(
//         fit: BoxFit.contain,
//         child: ClipRRect(
//           borderRadius: BorderRadius.only(
//               bottomRight: Radius.circular(60), topRight: Radius.circular(60)),
//           child: FadeInImage(
//             placeholder: AssetImage('assets/jar-loading.gif'),
//             image: AssetImage('assets/${innerImage}'),
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//       width: 60,
//       height: 120,
//       decoration: BoxDecoration(
//           color: Colors.purple,
//           borderRadius: BorderRadius.only(
//               bottomRight: Radius.circular(20), topRight: Radius.circular(20))),
//     );
//   }
// }

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
