import 'package:flutter/material.dart';
import 'package:movil181/app/data/data_source/remote/services.dart';
import 'package:movil181/app/domain/models/models.dart';
import 'package:movil181/app/ui/pages/home/filter_home_page.dart';
import 'package:movil181/app/ui/pages/loading_screen/loading_screen_page.dart';
import 'package:movil181/app/ui/routes/routes.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'package:flutter_meedu/flutter_meedu.dart' as meedu;
import 'package:movil181/app/domain/repositories/authentication_repository.dart';
import 'package:flutter_meedu/router.dart' as router;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storeService = Provider.of<StoreService>(context);
    if (storeService.isLoading) return LoadingScreen();
    final List<Stores> lista = storeService.listStores;

    return Stack(
      children: [
        // Positioned(
        //   //height: 300,
        //   child: (Container(
        //     decoration: BoxDecoration(
        //       image: DecorationImage(
        //         image: AssetImage("assets/Imagen1.png"), // <-- BACKGROUND IMAGE
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //   )),
        // ),
        Scaffold(
          //backgroundColor: Colors.transparent,
          appBar: AppBarGeneral().appBarG(context),
          body: Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Container(
                child: ListView.builder(
                    itemCount: storeService.listStores.length,
                    itemBuilder: (BuildContext context, int index) =>
                        GestureDetector(
                          onTap: () {
                            storeService.selectedStore =
                                storeService.listStores[index];
                            Navigator.pushNamed(context, Routes.PROJECT);
                          },
                          child: StoreCard(
                            store: storeService.listStores[index],
                          ),
                        )),
              )),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              storeService.selectedStore = new Stores(
                  category: 'sdg-es-07.png',
                  contact: '',
                  decription: '',
                  image:
                      'https://res.cloudinary.com/rinckoar/image/upload/v1637593321/ODS/logoODSxelcambio_lgfctx.png',
                  name: '',
                  atribution: 'autor');
              Navigator.pushNamed(context, Routes.ADDPROJECT);
            },
            child: Icon(Icons.add),
            //backgroundColor: Colors.purple,
          ),
        ),
      ],
    );
  }
}

void onSelected(BuildContext context, int item) {
  //final storeService = Provider.of<StoreService>(context, listen: false);
  switch (item) {
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilterHome(lista: 1, name: 'Restaurantes')));
      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilterHome(lista: 2, name: 'Farmacias')));
      break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilterHome(lista: 3, name: 'Licores')));
      break;
    case 4:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilterHome(lista: 4, name: 'Minimercado')));
      break;
    case 5:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilterHome(lista: 5, name: 'Panaderías')));
      break;
    case 6:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              FilterHome(lista: 6, name: 'Paseador de perros')));
      break;
    case 7:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilterHome(lista: 7, name: 'Plomería')));
      break;
    case 8:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilterHome(lista: 8, name: 'Cerrajería')));
      break;
    case 9:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              FilterHome(lista: 9, name: 'Servicios eléctricos')));
      break;
    case 10:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              FilterHome(lista: 10, name: 'Servicios domésticos')));
      break;
  }
}
