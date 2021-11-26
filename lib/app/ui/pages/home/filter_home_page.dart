import 'package:flutter/material.dart';
import 'package:movil181/app/data/data_source/remote/services.dart';
import 'package:movil181/app/domain/models/models.dart';
import 'package:movil181/app/ui/pages/loading_screen/loading_screen_page.dart';
import 'package:movil181/app/ui/routes/routes.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class FilterHome extends StatelessWidget {
  const FilterHome({Key? key, required this.lista, required this.name})
      : super(key: key);
  final int lista;
  final String name;

  @override
  Widget build(BuildContext context) {
    final storeService = Provider.of<StoreService>(context, listen: false);
    final textConverter = TextConverter();
    var listado;
    String icono = '';
    String texto = '';
    if (storeService.isLoading) return LoadingScreen();

    switch (lista) {
      case 0:
        listado = storeService.listStores;
        break;
      case 1:
        listado = storeService.list1;
        icono = 'Restaurantes.png';
        texto = textConverter.infoCategory(icono);
        break;
      case 2:
        listado = storeService.list2;
        icono = 'Farmacias.png';
        texto = textConverter.infoCategory(icono);
        break;
      case 3:
        listado = storeService.list3;
        icono = 'Licores.png';
        texto = textConverter.infoCategory(icono);
        break;
      case 4:
        listado = storeService.list4;
        icono = 'Minimercado.png';
        texto = textConverter.infoCategory(icono);
        break;
      case 5:
        listado = storeService.list5;
        icono = 'Panaderias.png';
        texto = textConverter.infoCategory(icono);
        break;
      case 6:
        listado = storeService.list6;
        icono = 'Paseador.png';
        texto = textConverter.infoCategory(icono);
        break;
      case 7:
        listado = storeService.list7;
        icono = 'Plomeria.png';
        texto = textConverter.infoCategory(icono);
        break;
      case 8:
        listado = storeService.list8;
        icono = 'Cerrajeria.png';
        texto = textConverter.infoCategory(icono);
        break;
      case 9:
        listado = storeService.list9;
        icono = 'Electricos.png';
        texto = textConverter.infoCategory(icono);
        break;
      case 10:
        listado = storeService.list10;
        icono = 'Domesticos.png';
        texto = textConverter.infoCategory(icono);
        break;
    }

    return Scaffold(
      appBar: AppBarGeneral().appBarG(context),
      body: Padding(
          padding: EdgeInsets.only(bottom: 50),
          child: ListView.builder(
              itemCount: listado.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                    onTap: () {
                      storeService.selectedStore = listado[index];
                      Navigator.pushNamed(context, Routes.PROJECT);
                    },
                    child: StoreCard(
                      store: listado[index],
                    ),
                  ))),
      floatingActionButton: Row(
        children: <Widget>[
          SizedBox(width: 30),
          FloatingActionButton(
            heroTag: 'btn1',
            onPressed: () {
              viewInfo(context, icono, texto);
            },
            child: Icon(Icons.info_outline_rounded),
            //backgroundColor: Colors.purple,
          ),
          Expanded(child: SizedBox()),
          FloatingActionButton(
            heroTag: 'btn2',
            onPressed: () => Navigator.pushNamed(context, Routes.ADDPROJECT),
            child: Icon(Icons.add),
            //backgroundColor: Colors.purple,
          ),
        ],
      ),
    );
  }

  void viewInfo(BuildContext context, String icono, String texto) {
    showDialog(
        context: context,
        //para cerrar la alerta haciendo click afuera:
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            scrollable: true,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text(name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Monserrat',
                  fontSize: 22,
                  color: Colors.purple[800],
                ),
                textAlign: TextAlign.center),
            content: Column(
              //Para que se adapte el largo al contenido que tiene:
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: double.infinity,
                      child: icono == null
                          ? Image(
                              image: AssetImage('assets/no-image.png'),
                              fit: BoxFit.cover)
                          : FadeInImage(
                              placeholder: AssetImage('assets/jar-loading.gif'),
                              image: AssetImage('assets/${icono}'),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  texto,
                  textAlign: TextAlign.justify,
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
                      color: Colors.purple[800],
                    ),
                  )),
            ],
          );
        });
  }
}
