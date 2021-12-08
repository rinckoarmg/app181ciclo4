import 'package:flutter/material.dart';
import 'package:movil181/app/ui/routes/routes.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';

class ConfirmOrder extends StatelessWidget {
  const ConfirmOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBarGeneral().appBarG(context),
      body: Stack(
        children: [
          _BackgroungImage(
              imagen:
                  'https://cdn.pixabay.com/photo/2015/09/14/11/43/restaurant-939435_960_720.jpg'),
          Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 80),
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 7.5),
                          blurRadius: 10,
                        )
                      ]),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 25),
                          Text('Tu Pedido', style: textTheme.headline4),
                          SizedBox(height: 25),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 10),
                            child: Row(
                              children: [
                                Text('Pasta Carbonara X 2 ',
                                    style: textTheme.headline6),
                                Expanded(child: SizedBox()),
                                Text('\$50.000', style: textTheme.subtitle2)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 15),
                            child: Row(
                              children: [
                                Text('Pizza Napolitana X 1 ',
                                    style: textTheme.headline6),
                                Expanded(child: SizedBox()),
                                Text('\$25.000', style: textTheme.subtitle2)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 15),
                            child: Row(
                              children: [
                                Text('Limonada Natural X 3 ',
                                    style: textTheme.headline6),
                                Expanded(child: SizedBox()),
                                Text('\$13.500', style: textTheme.subtitle2)
                              ],
                            ),
                          ),
                          SizedBox(height: 40),
                          Text('Subtotal   \$ 88.500',
                              style: textTheme.headline5),
                          SizedBox(height: 10),
                          Text('Envío    \$ 2.000', style: textTheme.headline5),
                          SizedBox(height: 10),
                          Text('Total    \$ 90.500',
                              style: textTheme.headline5),
                          SizedBox(height: 30),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, Routes.SUCCESS);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  'Confirmar',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ))
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackgroungImage extends StatelessWidget {
  final String? imagen;

  const _BackgroungImage({Key? key, this.imagen}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.green,
      width: double.infinity,
      height: size.height * 0.40,
      child: FadeInImage(
          fit: BoxFit.cover,
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(imagen!)),
    );
  }
}
