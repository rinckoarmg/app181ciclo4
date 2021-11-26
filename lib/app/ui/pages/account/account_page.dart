import 'package:flutter/material.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGeneral().appBarG(context),
      body: Center(
        child: CircleAvatar(
            backgroundColor: Colors.greenAccent[400],
            radius: 100,
            backgroundImage: AssetImage('assets/no-image.png')
            // child: Text(
            //   'Foto Usuario',
            //   style: TextStyle(fontSize: 25, color: Colors.white),
            // ),
            ),
      ),
    );
  }
}
