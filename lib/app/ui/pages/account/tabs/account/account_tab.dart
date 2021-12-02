import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:movil181/app/data/data_source/remote/services.dart';
import 'package:movil181/app/domain/models/models.dart';
import 'package:movil181/app/ui/global_controllers/session_controller.dart';
import 'package:movil181/app/ui/routes/routes.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart' as prov;

class AccountTab extends StatelessWidget {
  const AccountTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = User;
    final TextTheme textTheme = Theme.of(context).textTheme;

    final orderService = prov.Provider.of<OrderService>(context);
    final storeService = prov.Provider.of<StoreService>(context);
    final productService = prov.Provider.of<ProductService>(context);
    return Container(
      child: SingleChildScrollView(
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
                    Consumer(builder: (_, ref, __) {
                      final user =
                          ref.select(sessionProvider.select((_) => _.user!));
                      return Text(user.displayName ?? '',
                          style: textTheme.subtitle1);
                    }),
                    SizedBox(height: 10),
                    Text(
                      'Email',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Monserrat',
                          fontSize: 22,
                          color: Colors.teal[800]),
                    ),
                    Consumer(builder: (_, ref, __) {
                      final user =
                          ref.select(sessionProvider.select((_) => _.user));
                      return Text(user!.email ?? '',
                          style: textTheme.subtitle1);
                    }),
                    SizedBox(height: 10),
                    Text(
                      'Celular',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Monserrat',
                          fontSize: 22,
                          color: Colors.teal[800]),
                    ),
                    Consumer(builder: (_, ref, __) {
                      final user =
                          ref.select(sessionProvider.select((_) => _.user));
                      return Text(user!.phoneNumber ?? '3333333333',
                          style: textTheme.subtitle1);
                    }),
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
        ]),
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
