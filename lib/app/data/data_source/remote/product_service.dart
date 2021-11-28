import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movil181/app/domain/models/models.dart';

class ProductService extends ChangeNotifier {
  final String _baseUrl = 'flutter-tiendas-default-rtdb.firebaseio.com';
  final List<Productos> listProductos = [];

  late Productos selectedProduct;

  File? newPhoto;
  bool isLoading = true;
  bool isSaving = false;

  ProductService() {
    loadProductos();
  }

  Future<List<Productos>> loadProductos() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, '/productos.json');
    final resp = await http.get(url);
    final Map<String, dynamic> projectMap = json.decode(resp.body);
    //print(projectMap);

    projectMap.forEach((key, value) {
      final tempProductos = Productos.fromMap(value);
      tempProductos.referencia = key;
      listProductos.add(tempProductos);
    });

    isLoading = false;
    notifyListeners();

    //print(listProductos);
    return listProductos;
  }

  Future saveProduct(Productos project) async {
    isSaving = true;
    notifyListeners();

    if (project.referencia == null) {
      await createProduct(project);
    } else {
      await this.updateProduct(project);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Productos project) async {
    final url = Uri.https(_baseUrl, '/project/${project.referencia}.json');
    final resp = await http.put(url, body: project.toJson());
    final decodeData = resp.body;

    print(decodeData);

    final index =
        listProductos.indexWhere((i) => i.referencia == project.referencia);
    listProductos[index] = project;
    return project.referencia;
  }

  Future<String> createProduct(Productos project) async {
    final url = Uri.https(_baseUrl, '/project.json');
    final resp = await http.post(url, body: project.toJson());
    final decodeData = json.decode(resp.body);

    project.referencia = decodeData['name'];

    this.listProductos.add(project);
    return project.referencia;
  }

  void updatePhoto(String path) {
    selectedProduct.imagen = path;
    newPhoto = File.fromUri(Uri(path: path));
    notifyListeners();
  }

  Future<String?> uploadPhoto() async {
    if (newPhoto == null) return null;
    isSaving = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/rinckoar/image/upload?upload_preset=20Cuadras');

    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file = await http.MultipartFile.fromPath('file', newPhoto!.path);

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final res = await http.Response.fromStream(streamResponse);

    if (res.statusCode != 200 && res.statusCode != 201) {
      print('error');
      print(res.body);
      return null;
    }
    newPhoto = null;

    final decodeData = json.decode(res.body);
    return decodeData['secure_url'];
  }
}
