import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:movil181/app/domain/repositories/authentication_repository.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:movil181/app/ui/routes/routes.dart';

class AppBarGeneral extends StatelessWidget {
  const AppBarGeneral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  PreferredSizeWidget appBarG() {
    return AppBar(
      elevation: 0.5,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '20 Cuadras',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Monserrat',
              fontSize: 25,
              color: Colors.teal[800],
            ),
          ),
        ],
      ),
      centerTitle: true,
      actions: <Widget>[
        //AtomsCommon().buttomAppbBar('notifications'),
        /*
        Container(
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_to_photos),
          )
        ),
        */
        Container(
            child: IconButton(
          onPressed: () async {
            await Get.i.find<AuthenticationRepository>().signOut();
            router.pushNamedAndRemoveUntil(Routes.LOGIN);
          },
          icon: Icon(Icons.exit_to_app),
        )),
      ],
    );
  }
}
