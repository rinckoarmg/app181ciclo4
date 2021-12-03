import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/state.dart';
import 'package:movil181/app/data/data_source/remote/services.dart';
import 'package:movil181/app/ui/global_controllers/session_controller.dart';
import 'package:movil181/app/ui/routes/routes.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart' as prov;

class ProductProfileTab extends ConsumerWidget {
  const ProductProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final size = MediaQuery.of(context).size;
    final user = User;
    final TextTheme textTheme = Theme.of(context).textTheme;

    final productService = prov.Provider.of<ProductService>(context);
    final sessionController = ref.watch(sessionProvider);
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text('Mis Productos', style: textTheme.headline5),
        SizedBox(height: 20),
        Expanded(
          flex: 15,
          child: Container(
            //margin: EdgeInsets.only(bottom: 25),
            //padding: EdgeInsets.only(bottom: 18),
            //color: Colors.blue,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: productService.listProductos.length,
                itemBuilder: (_, int index) => GestureDetector(
                      onTap: () {
                        productService.selectedProduct =
                            productService.listProductos[index];
                        Navigator.pushNamed(context, Routes.ADDPROJECT);
                      },
                      child: UserProductCard(
                          uProduct: productService.listProductos[index]),
                    )
                //UserStoreCard(uStore: storeService.listStores[index]),
                ),
          ),
        ),
        // Expanded(
        //     flex: 1,
        //     child: Container(
        //         //padding: EdgeInsets.only(top: 10),
        //         //color: Colors.amber,
        //         )),
      ]),
    );
  }
}
