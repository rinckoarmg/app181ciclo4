import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:movil181/app/domain/repositories/authentication_repository.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:movil181/app/ui/pages/home/filter_home_page.dart';
import 'package:movil181/app/ui/routes/routes.dart';

class AppBarGeneral extends StatelessWidget {
  const AppBarGeneral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  PreferredSizeWidget appBarG(context) {
    return AppBar(
      elevation: 0.5,
      backgroundColor: Colors.white,
      foregroundColor: Colors.teal,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/logotemp.png'), height: 30),
          Text(
            '20 Cuadras',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Monserrat',
              fontSize: 25,
              //color: Colors.teal[800],
            ),
          ),
        ],
      ),
      centerTitle: true,
      actions: <Widget>[
        //AtomsCommon().buttomAppbBar('notifications'),

        // Container(
        //     child: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.add_to_photos),
        // )),

        GestureDetector(
          //margin: EdgeInsets.only(right: 10.0),
          onTap: () => Navigator.pushNamed(context, Routes.ACCOUNT),
          child: CircleAvatar(
            child: Text('CU'),
            backgroundColor: Colors.teal[100],
          ),
        ),

        // Container(
        //     child: IconButton(
        //   onPressed: () async {
        //     await Get.i.find<AuthenticationRepository>().signOut();
        //     router.pushNamedAndRemoveUntil(Routes.LOGIN);
        //   },
        //   icon: Icon(Icons.exit_to_app),
        // )),
        _menu(context),
      ],
    );
  }

  PopupMenuButton<int> _menu(context) {
    return PopupMenuButton<int>(
        enableFeedback: true,
        tooltip: 'Lista de categorias',
        icon: Icon(Icons.menu),
        onSelected: (item) => onSelected(context, item),
        itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Text('Restaurantes'),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text('Farmacias'),
              ),
              const PopupMenuItem(
                value: 3,
                child: Text('Licores'),
              ),
              const PopupMenuItem(
                value: 4,
                child: Text('Minimercado'),
              ),
              const PopupMenuItem(
                value: 5,
                child: Text('Panaderías'),
              ),
              const PopupMenuItem(
                value: 6,
                child: Text('Paseador de perros'),
              ),
              const PopupMenuItem(
                value: 7,
                child: Text('Plomería'),
              ),
              const PopupMenuItem(
                value: 8,
                child: Text('Cerrajería'),
              ),
              const PopupMenuItem(
                value: 9,
                child: Text('Servicios eléctricos'),
              ),
              const PopupMenuItem(
                value: 10,
                child: Text('Servicios domésticos'),
              ),
            ]);
  }
}

void onSelected(BuildContext context, int item) {
  //final storeService = Provider.of<StoreService>(context, listen: false);
  switch (item) {
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilterHome(lista: 1, name: 'Restaurantes')));
      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilterHome(lista: 2, name: 'Farmacias')));
      break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilterHome(lista: 3, name: 'Licores')));
      break;
    case 4:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilterHome(lista: 4, name: 'Minimercado')));
      break;
    case 5:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilterHome(lista: 5, name: 'Panaderías')));
      break;
    case 6:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              FilterHome(lista: 6, name: 'Paseador de perros')));
      break;
    case 7:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilterHome(lista: 7, name: 'Plomería')));
      break;
    case 8:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilterHome(lista: 8, name: 'Cerrajería')));
      break;
    case 9:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              FilterHome(lista: 9, name: 'Servicios eléctricos')));
      break;
    case 10:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              FilterHome(lista: 10, name: 'Servicios domésticos')));
      break;
  }
}
