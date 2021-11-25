// To parse required this JSON data, do
//
//     final stores = storesFromMap(jsonString);

import 'dart:convert';

class Productos {
  Productos({
    required this.descripcion,
    required this.nombre,
    required this.disponibilidad,
    required this.imagen,
    required this.precio,
    required this.referencia,
    required this.nit,
  });

  String descripcion;
  String nombre;
  bool disponibilidad;
  String imagen;
  int precio;
  String referencia;
  String nit;

  factory Productos.fromJson(String str) => Productos.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Productos.fromMap(Map<String, dynamic> json) => Productos(
        descripcion: json["descripcion"],
        nombre: json["nombre"],
        disponibilidad: json["disponibilidad"],
        imagen: json["imagen"],
        precio: json["precio"].toInt(),
        referencia: json["referencia"],
        nit: json["nit"],
      );

  Map<String, dynamic> toMap() => {
        "descripcion": descripcion,
        "nombre": nombre,
        "disponibilidad": disponibilidad,
        "imagen": imagen,
        "precio": precio,
        "referencia": referencia,
        "nit": nit,
      };
}
