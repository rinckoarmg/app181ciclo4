// To parse this JSON data, do
//
//     final projects = projectsFromMap(jsonString);

import 'dart:convert';

class Stores {
  Stores({
    required this.category,
    required this.contact,
    this.address,
    required this.decription,
    required this.image,
    required this.name,
    this.web,
    this.id,
    this.email,
    this.user,
    this.atribution,
  });

  String category;
  String contact;
  String? address;
  String decription;
  String image;
  String name;
  String? web;
  String? id;
  String? email;
  String? user;
  String? atribution;

  factory Stores.fromJson(String str) => Stores.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Stores.fromMap(Map<String, dynamic> json) => Stores(
      category: json["category"],
      contact: json["contact"],
      address: json["address"],
      decription: json["decription"],
      image: json["image"],
      name: json["name"],
      web: json["web"],
      email: json["email"],
      user: json["user"],
      atribution: json["atribution"]);

  Map<String, dynamic> toMap() => {
        "category": category,
        "contact": contact,
        "address": address,
        "decription": decription,
        "image": image,
        "name": name,
        "web": web,
        "email": email,
        "user": user,
        "atribution": atribution,
      };

  Stores copy() => Stores(
        id: this.id,
        category: this.category,
        contact: this.contact,
        address: this.address,
        decription: this.decription,
        image: this.image,
        name: this.name,
        web: this.web,
        email: this.email,
        user: this.user,
        atribution: this.atribution,
      );
}
