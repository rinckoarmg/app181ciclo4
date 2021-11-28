import 'package:flutter/material.dart';

class Listas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  List<String> listIconsLong() {
    List<String> listIconsLong = [
      'Restaurantes.png',
      'Farmacias.png',
      'Licores.png',
      'Minimercado.png',
      'Panaderias.png',
      'Paseador.png',
      'Plomeria.png',
      'Cerrajeria.png',
      'Electricos.png',
      'Domesticos.png',
    ];
    return listIconsLong;
  }

  List<String> listIconsSquare() {
    List<String> listIconsSquare = [
      'Restaurantes1.png',
      'Farmacias1.png',
      'Licores1.png',
      'Minimercado1.png',
      'Panaderias1.png',
      'Paseador1.png',
      'Plomeria1.png',
      'Cerrajeria1.png',
      'Electricos1.png',
      'Domesticos1.png'
    ];
    return listIconsSquare;
  }

  List<String> listCategories() {
    List<String> listCategories = [
      'Restaurantes',
      'Farmacias',
      'Licores',
      'Minimercado',
      'Panaderías',
      'Paseador de perros',
      'Plomería',
      'Cerrajería',
      'Servicios eléctricos',
      'Servicios domésticos',
      'Todas las Categorias'
    ];
    return listCategories;
  }
}
