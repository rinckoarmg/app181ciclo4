import 'package:flutter/material.dart';
import 'package:movil181/app/data/data_source/remote/product_service.dart';
import 'package:movil181/app/ui/routes/routes.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {  
  int _cont = 0;
  
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    final textConverter = TextConverter();
    final viewInfo = ViewInfoCategory();

    return Scaffold(
      appBar: AppBarGeneral().appBarG(context),
      body: Stack(children: [
        _BackgroungImage(imagen: productService.selectedProduct.imagen),
        Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      //height: 410,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 7.5),
                              blurRadius: 10,
                            )
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Text(
                                productService.selectedProduct.nombre,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Monserrat',
                                  fontSize: 24,
                                  color: Colors.teal[800],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: 30, right: 20, left: 20),
                            child: Text(
                              productService.selectedProduct.descripcion,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontFamily: 'Monserrat',
                                fontSize: 15,
                                color: Colors.black54,
                              ),
                              maxLines: 7,
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Text(
                                'Precio/unidad: \$${productService.selectedProduct.precio}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Monserrat',
                                  fontSize: 20,
                                  color: Colors.teal[800],
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Text(
                                'Unidades:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Monserrat',
                                  fontSize: 24,
                                  color: Colors.teal[800],
                                ),
                              ),
                            ),
                          ),
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FloatingActionButton(mini: true, onPressed: _sustraer, child: Icon(Icons.remove), heroTag: 'btn1'),
                              SizedBox(width: 20),
                              Text('$_cont', style: TextStyle(fontSize: 45)),
                              SizedBox(width: 20),
                              FloatingActionButton(mini: true ,onPressed: _agregar, child: Icon(Icons.add), heroTag: 'btn2'),
                            ],
                          ),
                          
                          Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Text(
                                'Precio Final: \$${(productService.selectedProduct.precio)*_cont}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Monserrat',
                                  fontSize: 24,
                                  color: Colors.teal[800],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          //TODO:llevar la orden del pedido
                          Center(child: ElevatedButton(onPressed: (){}, child: Text('Hacer pedido',style: TextStyle(fontSize: 20),))),
                          SizedBox(height: 20),
                        ],
                      )),
                ],
              ),
            )),
      ]),
    );
  }

  void _agregar(){
    setState(() => _cont++ ); //<-este sirve para que se redibuje el widget
  }

  void _sustraer(){
    if (_cont >= 1) {
      setState(() => _cont--);  
    }
  }
}


class _BackgroungImage extends StatelessWidget {
  final String? imagen;

  const _BackgroungImage({Key? key, this.imagen}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.green,
      width: double.infinity,
      height: size.height * 0.40,
      child: FadeInImage(
          fit: BoxFit.cover,
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(imagen!)),
    );
  }
}
