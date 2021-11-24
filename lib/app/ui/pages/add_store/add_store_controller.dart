import 'package:flutter/material.dart';
import 'package:movil181/app/domain/models/models.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';

class AddStoreController extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Stores store;

  //constructor:
  AddStoreController(
      this.store); //es importante que el proyecto que se envie sea una copia.

  updateData(String value, int dato) {
    final textConverter = TextConverter();
    //print('IMPRESION EN CONSOLA del value: $value');
    switch (dato) {
      case 1:
        //this.store.id = value + '1';
        this.store.name = value;
        break;
      case 2:
        this.store.contact = value;
        break;
      case 3:
        this.store.address = value;
        break;
      case 4:
        this.store.decription = value;
        break;
      case 5:
        this.store.email = value;
        break;
      case 6:
        this.store.web = value;
        break;
      case 7:
        this.store.category = textConverter.categoryToIcon(value);
        break;
      case 8:
        this.store.atribution = value;
        break;

      default:
    }
    notifyListeners();
  }

  bool isValidForm() {
    print(store.name);
    print(store.category);
    print(store.contact);
    print(store.decription);
    print(store.email);
    print(store.id);
    print(store.image);
    print(store.web);

    return formKey.currentState?.validate() ?? false;
  }
}
