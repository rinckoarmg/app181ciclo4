import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movil181/app/data/data_source/remote/product_service.dart';
import 'package:movil181/app/data/data_source/remote/services.dart';
import 'package:movil181/app/domain/models/models.dart';
import 'package:movil181/app/ui/global_controllers/session_controller.dart';
import 'package:movil181/app/ui/pages/account/account_controller.dart';
import 'package:movil181/app/ui/pages/account/tabs/account/account_tab.dart';
import 'package:movil181/app/ui/pages/account/tabs/products/product_profile_tab.dart';
import 'package:movil181/app/ui/pages/account/tabs/stores/store_profile_tab.dart';
import 'package:movil181/app/ui/routes/routes.dart';
import 'package:movil181/app/ui/widgets/account_tab_bar.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart' as prov;

import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/state.dart';
import 'package:flutter_meedu/router.dart' as router;

final accountProvider = SimpleProvider(
  (_) => AccountController(),
);

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storeService = prov.Provider.of<StoreService>(context);

    return ProviderListener<AccountController>(
        provider: accountProvider,
        builder: (_, controller) {
          return Scaffold(
            bottomNavigationBar: AccountTabBar(),
            appBar: AppBarGeneral().appBarG(context),
            body: SafeArea(
                child: TabBarView(
              controller: controller.tabController,
              children: [
                AccountTab(),
                StoreProfileTab(),
                ProductProfileTab(),
              ],
            )),
            floatingActionButton: Row(
              children: <Widget>[
                SizedBox(width: 30),
                FloatingActionButton(
                  tooltip: 'Cerrar sesión',
                  heroTag: 'btn1',
                  onPressed: () async {
                    await sessionProvider.read.singOut();
                    router.pushNamedAndRemoveUntil(Routes.LOGIN);
                  },
                  child: Icon(Icons.exit_to_app_rounded),
                ),
                Expanded(child: SizedBox()),
                FloatingActionButton(
                    tooltip: 'Crear tienda',
                    heroTag: 'btn2',
                    onPressed: () {
                      storeService.selectedStore = new Stores(
                          category: 'Restaurantes.png',
                          contact: '',
                          decription: '',
                          image:
                              'https://res.cloudinary.com/rinckoar/image/upload/v1638138172/20Cuadras/20_Cuadras2_b_lnqxkr.png',
                          name: '',
                          atribution: 'autor');
                      Navigator.pushNamed(context, Routes.ADDPROJECT);
                    },
                    child: Icon(Icons.add_business)),
              ],
            ),
          );
        });
  }
}
