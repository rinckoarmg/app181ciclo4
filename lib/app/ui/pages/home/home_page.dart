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
                      'https://res.cloudinary.com/rinckoar/image/upload/v1638138172/20Cuadras/20_Cuadras2_b_lnqxkr.png',
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
