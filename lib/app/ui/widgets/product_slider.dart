import 'package:flutter/material.dart';
import 'package:movil181/app/domain/models/models.dart';
import 'package:movil181/app/ui/routes/routes.dart';

class ProductosSlider extends StatelessWidget {
  final List<Productos> listP;
  final String nombre;

  const ProductosSlider({Key? key, required this.listP, required this.nombre})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      //color: Colors.blueAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 20),
          //     child: Text(
          //       tituloProducto,
          //       style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         fontFamily: 'Monserrat',
          //         fontSize: 24,
          //         color: Colors.teal[800],
          //       ),
          //     )),
          //SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listP.length,
                itemBuilder: (BuildContext context, int index) {
                  final categ = listP[index];
                  return _ImagenProducto(categ.imagen, categ.nombre);
                }),
          ),
        ],
      ),
    );
  }
}

class _ImagenProducto extends StatelessWidget {
  final String url;
  final String? title;

  const _ImagenProducto(this.url, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      //color: Colors.green,
      //margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, Routes.PRODUCT,
                arguments: 'Producto-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                  placeholder: AssetImage('assets/no-image.png'),
                  image: NetworkImage(url)),
            ),
          ),
          SizedBox(height: 5),
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
