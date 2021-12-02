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
  const StoreProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final user = User;
    final TextTheme textTheme = Theme.of(context).textTheme;

    final orderService = prov.Provider.of<OrderService>(context);
    final storeService = prov.Provider.of<StoreService>(context);
    final productService = prov.Provider.of<ProductService>(context);
    final sessionController = ref.watch(sessionProvider);
    return Container(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (_, int index) => GestureDetector(
                onTap: () {
                  storeService.selectedStore = storeService.listStores[index];
                  Navigator.pushNamed(context, Routes.ADDPROJECT);
                },
                child: UserStoreCard(uStore: storeService.listStores[index]),
              )
          //UserStoreCard(uStore: storeService.listStores[index]),

          ),
    );
  }
}
