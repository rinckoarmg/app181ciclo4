import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movil181/app/data/data_source/remote/services.dart';
import 'package:movil181/app/ui/pages/add_store/add_store_controller.dart';
import 'package:movil181/app/ui/widgets/store_image.dart';

import 'package:movil181/app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class AddStorePage extends StatefulWidget {
  const AddStorePage({Key? key}) : super(key: key);

  @override
  _AddStorePageState createState() => _AddStorePageState();
}

class _AddStorePageState extends State<AddStorePage> {
  @override
  Widget build(BuildContext context) {
    final storeService = Provider.of<StoreService>(context);
    final size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (_) => AddStoreController(storeService.selectedStore),
      child: AddStoreBody(storeService: storeService),
    );
  }
}

class AddStoreBody extends StatefulWidget {
  final StoreService storeService;

  const AddStoreBody({Key? key, required this.storeService}) : super(key: key);

  @override
  _AddStoreBodyState createState() => _AddStoreBodyState();
}

class _AddStoreBodyState extends State<AddStoreBody> {
  @override
  Widget build(BuildContext context) {
    final pService = Provider.of<AddStoreController>(context);
    final storeCopied = pService.store;
    final StoreService storeService;

    return Scaffold(
      appBar: AppBarGeneral().appBarG(),
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 80),
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 7.5),
                          blurRadius: 10,
                        )
                      ]),
                  child: Form(
                    key: pService.formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Title(
                            color: Colors.teal,
                            child: Text(
                              'Datos de la tienda',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Monserrat',
                                fontSize: 20,
                                color: Colors.teal[800],
                              ),
                            )),
                        _categoria(storeCopied.category, pService),
                        _direccion(storeCopied.address, pService),
                        _nombre(storeCopied.name, pService),
                        _descripcion(storeCopied.decription, pService),
                        _telefono(storeCopied.contact, pService),
                        _email(storeCopied.email, pService),
                        _web(storeCopied.web, pService),
                        _imagen(storeCopied.image),
                        _atribucion(storeCopied.atribution, pService),
                        SizedBox(height: 30)
                      ],
                    ),
                  )),
            )),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: widget.storeService.isSaving
              ? null
              : () async {
                  if (!pService.isValidForm()) return;
                  final String? imageUrl =
                      await widget.storeService.uploadPhoto();

                  if (imageUrl != null) pService.store.image = imageUrl;

                  await widget.storeService.saveStore(pService.store);
                  Navigator.of(context).pop();
                },
          child: widget.storeService.isSaving
              ? CircularProgressIndicator(color: Colors.white)
              : Icon(Icons.save)),
    );
  }

  Widget _categoria(String category, AddStoreController pService) {
    final textConverter = TextConverter();
    String _opcionSeleccionada = textConverter.iconToCategory(category);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, left: 25, right: 25),
          child: Text(
            'Categoria:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Monserrat',
              fontSize: 20,
              color: Colors.teal[800],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: DropdownButtonFormField(
            isExpanded: true,
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = opt.toString();
              });
              value:
              pService.updateData(opt.toString(), 7);
            },
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    final List _categories = [
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
      'La categoria NO existe!'
    ];
    List<DropdownMenuItem<String>> lista = [];

    _categories.forEach((i) {
      lista.add(DropdownMenuItem(
        child: Text(i),
        value: i,
      ));
    });
    return lista;
  }

  Widget _nombre(
    String name,
    AddStoreController pService,
  ) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Monserrat',
      fontSize: 20,
      color: Colors.teal[800],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, right: 25, left: 25),
          child: Text(
            'Nombre del establecimiento',
            style: textStyle,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              initialValue: name,
              onChanged: (value) => pService.updateData(value, 1),
              validator: (value) {
                if (value == null || value.length < 1)
                  return 'El nombre es obligatorio';
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _descripcion(String decription, AddStoreController pService) {
    var textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Monserrat',
      fontSize: 20,
      color: Colors.teal[800],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, right: 25, left: 25),
          child: Text(
            'Descripción',
            textAlign: TextAlign.left,
            style: textStyle,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              initialValue: decription,
              onChanged: (value) => pService.updateData(value, 4),
              validator: (value) {
                if (value == null || value.length < 1)
                  return 'La descripción es obligatoria';
              },
              maxLines: 15,
              minLines: 1,
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ],
    );
  }

  Widget _telefono(String contact, AddStoreController pService) {
    var textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Monserrat',
      fontSize: 20,
      color: Colors.teal[800],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, right: 25, left: 25),
          child: Text(
            'Teléfono de contacto',
            textAlign: TextAlign.left,
            style: textStyle,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              initialValue: contact,
              onChanged: (value) => pService.updateData(value, 2),
              validator: (value) {
                if (value == null || value.length < 1)
                  return 'El teléfono es obligatorio';
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _email(String? email, AddStoreController pService) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Monserrat',
      fontSize: 20,
      color: Colors.teal[800],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, right: 25, left: 25),
          child: Text(
            'Email',
            textAlign: TextAlign.left,
            style: textStyle,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              initialValue: email,
              onChanged: (value) => pService.updateData(value, 5),
              validator: (value) {
                if (value == null || value.length < 1)
                  return 'El email es obligatorio';
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _web(String? web, AddStoreController pService) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Monserrat',
      fontSize: 20,
      color: Colors.teal[800],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, right: 25, left: 25),
          child: Text(
            'Website',
            textAlign: TextAlign.left,
            style: textStyle,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              initialValue: web,
              onChanged: (value) => pService.updateData(value, 6),
              validator: (value) {
                if (value == null || value.length < 1)
                  return 'Ingresa una URL donde puedan encontrar más información';
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _direccion(String? address, AddStoreController pService) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Monserrat',
      fontSize: 20,
      color: Colors.teal[800],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, right: 25, left: 25),
          child: Text(
            'Dirección',
            textAlign: TextAlign.left,
            style: textStyle,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              initialValue: address,
              onChanged: (value) => pService.updateData(value, 3),
              validator: (value) {
                if (value == null || value.length < 1)
                  return 'La dirección es obligatoria';
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _imagen(String image) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Monserrat',
      fontSize: 20,
      color: Colors.teal[800],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, right: 25, left: 25),
          child: Text(
            'Imagen',
            textAlign: TextAlign.left,
            style: textStyle,
          ),
        ),
        SizedBox(
          //height: 150,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              children: [
                StoreImage(url: widget.storeService.selectedStore.image),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: IconButton(
                    //alignment: Alignment.topCenter,
                    icon: Icon(
                      Icons.add_a_photo,
                      size: 50,
                      color: Colors.teal[200],
                    ),
                    onPressed: () async {
                      final ImagePicker picker = new ImagePicker();
                      final XFile? foto = await picker.pickImage(
                          source: ImageSource.gallery, imageQuality: 100);

                      if (foto == null) {
                        print('No seleccionó nada');
                        return;
                      }
                      //final File fotoPath = File(foto.path);
                      print('La imagen es ${foto.path}');
                      widget.storeService.updatePhoto(foto.path);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _atribucion(String? atribution, AddStoreController pService) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Monserrat',
      fontSize: 20,
      color: Colors.teal[800],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, right: 25, left: 25),
          child: Text(
            'Autor de la imagen',
            textAlign: TextAlign.left,
            style: textStyle,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              initialValue: atribution,
              onChanged: (value) => pService.updateData(value, 8),
              validator: (value) {
                if (value == null || value.length < 1)
                  return 'Ingresa el autor de la imagen';
              },
            ),
          ),
        ),
      ],
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        //para cerrar la alerta haciendo click afuera:
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text('Confirmacion',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Monserrat',
                  fontSize: 22,
                  color: Colors.teal[800],
                )),
            content: Text(
              '¿Estas seguro de crear este proyecto?',
              maxLines: 2,
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child:
                      Text('Cancelar', style: TextStyle(color: Colors.black))),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    'Salvar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Monserrat',
                      fontSize: 18,
                      color: Colors.teal[800],
                    ),
                  )),
            ],
          );
        });
  }
}
