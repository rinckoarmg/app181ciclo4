import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:movil181/app/domain/repositories/authentication_repository.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:movil181/app/ui/pages/home/filter_home_page.dart';
import 'package:movil181/app/ui/routes/routes.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';

class AppBarGeneral extends StatelessWidget {
  const AppBarGeneral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  PreferredSizeWidget appBarG(context) {
    Listas categorias = Listas();
    return AppBar(
      elevation: 0.5,
      backgroundColor: Colors.white,
      foregroundColor: Colors.teal,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/20Cuadras2_b.png'), height: 60),
          // Text(
          //   '20 Cuadras',
          //   style: TextStyle(
          //     fontWeight: FontWeight.bold,
          //     fontFamily: 'Monserrat',
          //     fontSize: 25,
          //     //color: Colors.teal[800],
          //   ),
          // ),
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
        _menu(context, categorias),
      ],
    );
  }

  PopupMenuButton<int> _menu(context, Listas tituloCategoria) {
    return PopupMenuButton<int>(
        enableFeedback: true,
        tooltip: 'Lista de categorias',
        icon: const Icon(Icons.menu),
        onSelected: (item) => onSelected(context, item, tituloCategoria),
        itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                            image: AssetImage(
                                'assets/${tituloCategoria.listIconsSquare()[0]}'),
                            height: 40)),
                    const SizedBox(width: 15),
                    Text(tituloCategoria.listCategories()[0],
                        style: TextStyle(color: Colors.grey[700])),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                            image: AssetImage(
                                'assets/${tituloCategoria.listIconsSquare()[1]}'),
                            height: 40)),
                    const SizedBox(width: 15),
                    Text(tituloCategoria.listCategories()[1],
                        style: TextStyle(color: Colors.grey[700])),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 3,
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                            image: AssetImage(
                                'assets/${tituloCategoria.listIconsSquare()[2]}'),
                            height: 40)),
                    const SizedBox(width: 15),
                    Text(tituloCategoria.listCategories()[2],
                        style: TextStyle(color: Colors.grey[700])),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 4,
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                            image: AssetImage(
                                'assets/${tituloCategoria.listIconsSquare()[3]}'),
                            height: 40)),
                    const SizedBox(width: 15),
                    Text(tituloCategoria.listCategories()[3],
                        style: TextStyle(color: Colors.grey[700])),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 5,
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                            image: AssetImage(
                                'assets/${tituloCategoria.listIconsSquare()[4]}'),
                            height: 40)),
                    const SizedBox(width: 15),
                    Text(tituloCategoria.listCategories()[4],
                        style: TextStyle(color: Colors.grey[700])),
                  ],
                ),
              ),
              PopupMenuDivider(),
              PopupMenuItem(
                value: 6,
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                            image: AssetImage(
                                'assets/${tituloCategoria.listIconsSquare()[5]}'),
                            height: 40)),
                    const SizedBox(width: 15),
                    Text(tituloCategoria.listCategories()[5],
                        style: TextStyle(color: Colors.grey[700])),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 7,
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                            image: AssetImage(
                                'assets/${tituloCategoria.listIconsSquare()[6]}'),
                            height: 40)),
                    const SizedBox(width: 15),
                    Text(tituloCategoria.listCategories()[6],
                        style: TextStyle(color: Colors.grey[700])),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 8,
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                            image: AssetImage(
                                'assets/${tituloCategoria.listIconsSquare()[7]}'),
                            height: 40)),
                    const SizedBox(width: 15),
                    Text(tituloCategoria.listCategories()[7],
                        style: TextStyle(color: Colors.grey[700])),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 9,
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                            image: AssetImage(
                                'assets/${tituloCategoria.listIconsSquare()[8]}'),
                            height: 40)),
                    const SizedBox(width: 15),
                    Text(tituloCategoria.listCategories()[8],
                        style: TextStyle(color: Colors.grey[700])),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 10,
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                            image: AssetImage(
                                'assets/${tituloCategoria.listIconsSquare()[9]}'),
                            height: 40)),
                    const SizedBox(width: 15),
                    Text(
                      tituloCategoria.listCategories()[9],
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            ]);
  }
}

void onSelected(BuildContext context, int item, Listas tituloCategoria) {
  for (int y = 0; y < tituloCategoria.listCategories().length; y++) {
    if (item == y + 1) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilterHome(
              lista: y + 1, name: tituloCategoria.listCategories()[y])));
    }
  }
  /*
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
*/
}
