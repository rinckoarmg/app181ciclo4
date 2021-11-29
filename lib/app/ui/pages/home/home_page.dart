import 'package:flutter/material.dart';
import 'package:movil181/app/data/data_source/remote/services.dart';
import 'package:movil181/app/domain/models/models.dart';
import 'package:movil181/app/ui/pages/pages.dart';
import 'package:movil181/app/ui/routes/routes.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storeService = Provider.of<StoreService>(context);
    if (storeService.isLoading) return LoadingScreen();
    final List<Stores> lista = storeService.listStores;

    return Scaffold(
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
              category: 'Restaurantes.png',
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
    );
  }
}
