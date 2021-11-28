import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movil181/app/data/data_source/remote/services.dart';
import 'package:movil181/app/domain/models/order_model.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final orderService = Provider.of<OrderService>(context);
    final storeService = Provider.of<StoreService>(context);
    return Scaffold(
      appBar: AppBarGeneral().appBarG(context),
      body: SingleChildScrollView(
        child: Column(

            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.greenAccent[400],
                        radius: 80,
                        backgroundImage: AssetImage('assets/no-image.png')
                        // child: Text(
                        //   'Foto Usuario',
                        //   style: TextStyle(fontSize: 25, color: Colors.white),
                        // ),
                        ),
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
                itemCount: storeService.listStores.length,
                itemBuilder: (_, int index) =>
                    UserStoreCard(uStore: storeService.listStores[index]),
                //InfoPedido(order: orderService.listOrder[index]),
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
