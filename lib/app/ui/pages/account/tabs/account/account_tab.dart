import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/state.dart';
import 'package:movil181/app/data/data_source/remote/services.dart';
import 'package:movil181/app/domain/models/models.dart';
import 'package:movil181/app/ui/global_controllers/session_controller.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart' as prov;

class AccountTab extends ConsumerWidget {
  AccountTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final sessionController = ref.watch(sessionProvider);
    final user = sessionController.user!;

    final TextTheme textTheme = Theme.of(context).textTheme;

    final dName = user.displayName ?? '';
    final letter = dName.isNotEmpty ? dName[0] : "";

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
                  backgroundColor: Colors.teal[400],
                  radius: 80,
                  backgroundImage: user.photoURL != null
                      ? AssetImage('assets/no-image.png')
                      : null,
                  child: user.photoURL == null
                      ? Text(
                          letter,
                          style: const TextStyle(fontSize: 65),
                        )
                      : null,
                ),
                SizedBox(width: 30),
                Column(
                  children: [
                    Text(
                      'Nombre',
                      style: textTheme.headline4,
                    ),
                    Text(user.displayName ?? '', style: textTheme.subtitle1),
                    SizedBox(height: 10),
                    Text(
                      'Email',
                      style: textTheme.headline4,
                    ),
                    Text(user.email ?? '', style: textTheme.subtitle1),
                    SizedBox(height: 10),
                    Text(
                      'Celular',
                      style: textTheme.headline4,
                    ),
                    Text(user.phoneNumber ?? '3333333333',
                        style: textTheme.subtitle1),
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
