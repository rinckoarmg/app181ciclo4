import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movil181/app/data/data_source/remote/services.dart';
import 'package:movil181/app/domain/models/models.dart';
import 'package:movil181/app/domain/repositories/authentication_repository.dart';
import 'package:movil181/app/ui/routes/routes.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart' as prov;

import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/router.dart' as router;

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = User;
    final TextTheme textTheme = Theme.of(context).textTheme;

    final orderService = prov.Provider.of<OrderService>(context);
    final storeService = prov.Provider.of<StoreService>(context);
    return Scaffold(
      appBar: AppBarGeneral().appBarG(context),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.greenAccent[400],
                    radius: 80,
                    backgroundImage: AssetImage('assets/no-image.png')),
                SizedBox(width: 30),
                Column(
                  children: [
                    Text(
                      'Nombre',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Monserrat',
                          fontSize: 22,
                          color: Colors.teal[800]),
                    ),
                    Text(
                      'Amanda Triviño',
                      style: textTheme.bodyText1,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Email',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Monserrat',
                          fontSize: 22,
                          color: Colors.teal[800]),
                    ),
                    Text(
                      'amanda@domain.com',
                      style: textTheme.bodyText1,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Celular',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Monserrat',
                          fontSize: 22,
                          color: Colors.teal[800]),
                    ),
                    Text(
                      '3434856934',
                      style: textTheme.bodyText1,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          ),
          Text('Últimos pedidos', style: textTheme.headline4),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: orderService.listOrder.length,
            itemBuilder: (_, int index) =>
                OrdersCard(order: orderService.listOrder[index]),
            //InfoPedido(order: orderService.listOrder[index]),
          ),
          SizedBox(
            height: 10,
          ),
          Text('Mis tiendas', style: textTheme.headline4),
          SizedBox(
            height: 10,
          ),
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
              //InfoPedido(order: orderService.listOrder[index]),
              ),
        ]),
      ),
      floatingActionButton: Row(
        children: <Widget>[
          SizedBox(width: 30),
          FloatingActionButton(
            heroTag: 'btn1',
            onPressed: () async {
              await Get.i.find<AuthenticationRepository>().signOut();
              router.pushNamedAndRemoveUntil(Routes.LOGIN);
            },
            child: Icon(Icons.exit_to_app_rounded),
          ),
          Expanded(child: SizedBox()),
          FloatingActionButton(
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
  }
}

// class InfoPedido extends StatelessWidget {
//   final Orders order;
//   const InfoPedido({required this.order});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 130,
//       height: 170,
//       color: Colors.green,
//       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       child: Text(order.pedido),
//     );
//   }
// }
