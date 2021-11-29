import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'package:movil181/app/ui/pages/login/controller/login_controller.dart';
import 'package:movil181/app/ui/pages/login/utils/send_login_form.dart';
import 'package:movil181/app/ui/routes/routes.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';
import 'package:movil181/app/utils/validator_form.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:flutter_meedu/meedu.dart';

final loginProvider = SimpleProvider(
  (_) => LoginController(),
);

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<LoginController>(
      provider: loginProvider,
      builder: (_, controller) {
        return Scaffold(
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: ListView(
              children: [
                SingleChildScrollView(
                  //controller: controller,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          FadeInImage(
                            placeholder: AssetImage('assets/jar-loading.gif'),
                            width: 220,
                            image: AssetImage('assets/20Cuadras2_b.png')
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Login",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'Monserrat',
                              fontSize: 25,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Form(
                        key: controller.formKey,
                        child: Column(
                          children: <Widget>[
                            FormRegister(
                              label: 'Email',
                              onChanged: controller.onEmailChanged,
                              validator: (text) {
                                if (ValidatorForm().isValidEmail(text!)) {
                                  return null;
                                }
                                return "Email invalido";
                              },
                              isPassword: false,
                              icon: Icon(Icons.alternate_email),
                              icon2: Icons.email,
                            ),
                            SizedBox(height: 12),
                            FormRegister(
                              label: 'Contraseña',
                              onChanged: controller.onPasswordChanged,
                              validator: (text) {
                                if (text!.trim().length >= 8) {
                                  return null;
                                }
                                return "Contraseña invalida";
                              },
                              isPassword: true,
                              icon: Icon(Icons.lock),
                            ),
                            SizedBox(height: 30),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 50),
                              child: ElevatedButton(
                                onPressed: () => sendLoginForm(context),
                                child: Text('Confirmar'),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10),
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          TextButton(
                            child: Text(
                              'Registrarse',
                              style: TextStyle(
                                fontFamily: 'Monserrat',
                                fontSize: 18,
                                //color: Colors.purple
                              ),
                            ),
                            onPressed: () => router.pushNamed(Routes.REGISTER),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Column(
                        children: [
                          Logo().logo(),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Icon(Icons.copyright),
                            Text('  Desarrollado por DevTeam 181.')
                          ],)
                          
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
