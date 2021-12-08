import 'package:flutter/material.dart';
import 'package:movil181/app/ui/routes/routes.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

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
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 120),
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  height: 400,
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
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              '¡Tu pedido se ha completado con exito!',
                              style: textTheme.headline4,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 10),
                            child: Column(
                              children: [
                                Text('Tiempo estimado de entrega ',
                                    style: textTheme.headline6),
                                Text('25 Minutos', style: textTheme.subtitle2)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 15),
                            child: Column(
                              children: [
                                Text('¿Olvidaste algo? ',
                                    style: textTheme.headline6),
                                Text('Comunícate con el vendedor',
                                    style: textTheme.headline6),
                                Text('3103996930', style: textTheme.subtitle2)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 10),
                            child: Column(
                              children: [
                                Text('Total a pagar ',
                                    style: textTheme.headline4),
                                Text('\$ 90.500', style: textTheme.headline6)
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Buscar',
          onPressed: () => Navigator.pushNamed(context, Routes.HOME),
          child: Icon(Icons.home_filled)),
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
