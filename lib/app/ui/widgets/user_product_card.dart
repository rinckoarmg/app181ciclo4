import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:movil181/app/data/data_source/remote/product_service.dart';
import 'package:movil181/app/domain/models/models.dart';
import 'package:movil181/app/ui/routes/routes.dart';
import 'package:provider/provider.dart';

class UserProductCard extends StatelessWidget {
  final Productos uProduct;

  const UserProductCard({Key? key, required this.uProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storeService = Provider.of<ProductService>(context);
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          width: double.infinity,
          height: 50,
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
              _ProductDetails(uProduct),
              Positioned(
                  top: 10,
                  right: 20,
                  child: Row(
                    children: [
                      Icon(Icons.edit, color: Colors.teal),
                      Text('Editar', style: textTheme.headline5),
                    ],
                  )),
            ],
          )),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final Productos uProduct;

  const _ProductDetails(this.uProduct);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 120),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          width: double.infinity,
          height: 50,
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
                uProduct.nombre,
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
