import 'package:flutter/material.dart';
import 'package:movil181/app/data/data_source/remote/product_service.dart';
import 'package:movil181/app/data/data_source/remote/store_service.dart';
import 'package:movil181/app/ui/routes/routes.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final storeService = Provider.of<StoreService>(context);
    final productService = Provider.of<ProductService>(context);
    final textConverter = TextConverter();
    final viewInfo = ViewInfoCategory();

    return Scaffold(
      appBar: AppBarGeneral().appBarG(context),
      body: Stack(children: [
        _backgroungImage(imagen: storeService.selectedStore.image),
        Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 80),
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
                                storeService.selectedStore.name,
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
                                bottom: 10, right: 20, left: 20),
                            child: Text(
                              storeService.selectedStore.decription,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontFamily: 'Monserrat',
                                fontSize: 15,
                                color: Colors.black54,
                              ),
                              maxLines: 9,
                            ),
                          ),
                          // Column(
                          //   children: [
                          //     Padding(
                          //       padding: const EdgeInsets.symmetric(
                          //           horizontal: 20, vertical: 5),
                          //       child: Row(
                          //         children: [
                          //           Text(
                          //             "Teléfono: ",
                          //             style: TextStyle(
                          //               fontWeight: FontWeight.bold,
                          //               fontFamily: 'Monserrat',
                          //               fontSize: 18,
                          //               color: Colors.teal[800],
                          //             ),
                          //           ),
                          //           SizedBox(width: 20),
                          //           Text(storeService.selectedStore.contact),
                          //         ],
                          //       ),
                          //     ),
                          //     Padding(
                          //       padding: const EdgeInsets.symmetric(
                          //           horizontal: 20, vertical: 5),
                          //       child: Row(
                          //         children: [
                          //           Text(
                          //             "Dirección: ",
                          //             style: TextStyle(
                          //               fontWeight: FontWeight.bold,
                          //               fontFamily: 'Monserrat',
                          //               fontSize: 18,
                          //               color: Colors.teal[800],
                          //             ),
                          //           ),
                          //           SizedBox(width: 20),
                          //           Text(storeService.selectedStore.address!),
                          //         ],
                          //       ),
                          //     ),
                          //     Padding(
                          //       padding: const EdgeInsets.symmetric(
                          //           horizontal: 20, vertical: 5),
                          //       child: Row(
                          //         children: [
                          //           Text(
                          //             "Web: ",
                          //             style: TextStyle(
                          //               fontWeight: FontWeight.bold,
                          //               fontFamily: 'Monserrat',
                          //               fontSize: 18,
                          //               color: Colors.teal[800],
                          //             ),
                          //           ),
                          //           SizedBox(width: 20),
                          //           Text(storeService.selectedStore.web!),
                          //         ],
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ProductosSlider(
                                listP: productService.listProductos,
                                nombre: 'Productos'),
                          ),
                          SizedBox(height: 10),
                        ],
                      )),
                ],
              ),
            )),
      ]),
      floatingActionButton: Row(
        children: <Widget>[
          SizedBox(width: 30),
          FloatingActionButton(
              heroTag: 'btn1',
              onPressed: () {
                storeService.selectedStore;
                Navigator.pushNamed(context, Routes.ADDPROJECT);
              },
              child: Icon(Icons.edit)),
          Expanded(child: SizedBox()),
          FloatingActionButton(
              heroTag: 'btn2',
              onPressed: () => _viewContact(
                  context,
                  storeService.selectedStore.contact,
                  storeService.selectedStore.address,
                  storeService.selectedStore.web),
              child: Icon(Icons.contact_mail)),
        ],
      ),
    );
  }

  _viewContact(
      BuildContext context, String? tel, String? direccion, String? web) {
    showDialog(
        context: context,
        //para cerrar la alerta haciendo click afuera:
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text(
              "Contáctanos!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Monserrat',
                fontSize: 22,
                color: Colors.teal[800],
              ),
            ),
            content: Column(
              //Para que se adapte el largo al contenido que tiene:
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    SizedBox(height: 25),
                    Text(
                      "Teléfono: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Monserrat',
                        fontSize: 18,
                        color: Colors.teal[800],
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(tel!),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      "Dirección: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Monserrat',
                        fontSize: 18,
                        color: Colors.teal[800],
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(direccion!),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      "Web: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Monserrat',
                        fontSize: 18,
                        color: Colors.teal[800],
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(web!),
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Ok',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Monserrat',
                      fontSize: 18,
                      color: Colors.teal[800],
                    ),
                  )),
            ],
          );
        });
  }
}

class _backgroungImage extends StatelessWidget {
  final String? imagen;

  const _backgroungImage({Key? key, this.imagen}) : super(key: key);
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
