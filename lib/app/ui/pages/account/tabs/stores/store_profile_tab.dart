import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/state.dart';
import 'package:movil181/app/data/data_source/remote/services.dart';
import 'package:movil181/app/domain/models/models.dart';
import 'package:movil181/app/ui/global_controllers/session_controller.dart';
import 'package:movil181/app/ui/routes/routes.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart' as prov;

class StoreProfileTab extends ConsumerWidget {
  StoreProfileTab({Key? key}) : super(key: key);

  String user = '';

  @override
  Widget build(BuildContext context, ref) {
    final size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    final orderService = prov.Provider.of<OrderService>(context);
    final storeService = prov.Provider.of<StoreService>(context);
    final productService = prov.Provider.of<ProductService>(context);
    final sessionController = ref.watch(sessionProvider);

    user = sessionController.user!.displayName ?? '';
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Container(
        //color: Colors.amber,
        height: size.height * 0.60,
        child: Column(children: [
          Text('Mis tiendas', style: textTheme.headline5),
          SizedBox(height: 20),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (_, int index) => GestureDetector(
                    onTap: () {
                      storeService.selectedStore =
                          storeService.listStores[index];
                      Navigator.pushNamed(context, Routes.ADDPROJECT);
                    },
                    child:
                        UserStoreCard(uStore: storeService.listStores[index]),
                  )
              //UserStoreCard(uStore: storeService.listStores[index]),

              ),
        ]),
      ),
    );
  }
}
