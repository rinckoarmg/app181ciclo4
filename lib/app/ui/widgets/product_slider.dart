import 'package:flutter/material.dart';
import 'package:movil181/app/data/data_source/remote/product_service.dart';
import 'package:movil181/app/domain/models/models.dart';
import 'package:movil181/app/ui/routes/routes.dart';
import 'package:provider/provider.dart';

class ProductosSlider extends StatelessWidget {
  final List<Productos> listP;
  final String nombre;

  const ProductosSlider({Key? key, required this.listP, required this.nombre})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 240,
      //color: Colors.blueAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                nombre,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Monserrat',
                  fontSize: 24,
                  color: Colors.teal[800],
                ),
              )),
          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listP.length,
                itemBuilder: (BuildContext context, int index) {
                  final categ = listP[index];
                  return _ImagenProducto(
                      categ.imagen, categ.nombre, listP[index]);
                }),
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}

class _ImagenProducto extends StatelessWidget {
  final String url;
  final String? title;
  final Productos listP;

  const _ImagenProducto(this.url, this.title, this.listP);

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    return Container(
      //width: 140,
      //height: 140,
      //color: Colors.green,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.PRODUCT,
                  arguments: productService.selectedProduct = listP);
            },
            child: Container(
              height: 140,
              width: 140,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  fit: BoxFit.cover,
                    placeholder: AssetImage('assets/no-image.png'),
                    image: NetworkImage(url)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
