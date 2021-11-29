import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:movil181/app/ui/pages/register/controller/register_controller.dart';
import 'package:movil181/app/ui/pages/register/controller/register_state.dart';
import 'package:movil181/app/ui/pages/register/utils/send_register_form.dart';
import 'package:movil181/app/ui/routes/routes.dart';
import 'package:movil181/app/ui/widgets/form.dart';
import 'package:movil181/app/ui/widgets/logo.dart';
import 'package:movil181/app/utils/validator_form.dart';
import 'package:flutter_meedu/router.dart' as router;

final registerProvider = StateProvider<RegisterController, RegisterState>(
  (_) => RegisterController(),
);

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          children: [
            SingleChildScrollView(
              //controller: controller,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FadeInImage(
                          placeholder: AssetImage('assets/jar-loading.gif'),
                          width: 220,
                          image: AssetImage('assets/20Cuadras2_b.png')),
                      Text(
                        "Registro",
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
                  ProviderListener<RegisterController>(
                    provider: registerProvider,
                    builder: (_, controller) {
                      return Form(
                        key: controller.formKey,
                        child: Column(
                          children: <Widget>[
                            FormRegister(
                              label: 'Email',
                              onChanged: controller.onEmailChanged,
                              isPassword: false,
                              icon: Icon(Icons.alternate_email),
                              icon2: Icons.email,
                              validator: (text) {
                                print("text $text");

                                return ValidatorForm().isValidEmail(text!)
                                    ? null
                                    : "Correo invalido";
                              },
                            ),
                            SizedBox(height: 15),
                            FormRegister(
                              label: 'Nombre',
                              onChanged: controller.onNameChanged,
                              isPassword: false,
                              icon: Icon(Icons.accessibility),
                              icon2: Icons.account_circle,
                              validator: (text) {
                                return ValidatorForm().isValidName(text!)
                                    ? null
                                    : "Nombre invalido";
                              },
                            ),
                            SizedBox(height: 15),
                            FormRegister(
                              label: 'Contraseña',
                              onChanged: controller.onPasswordChanged,
                              isPassword: true,
                              icon: Icon(Icons.lock),
                              validator: (text) {
                                if (text!.trim().length >= 8) {
                                  return null;
                                }
                                return "Contraseña invalida";
                              },
                            ),
                            SizedBox(height: 15),
                            Consumer(
                              builder: (_, ref, __) {
                                final controller = ref.watch(
                                    registerProvider.select((_) => _.password));
                                return FormRegister(
                                  label: 'Confirmar contraseña',
                                  onChanged: controller.onVPasswordChanged,
                                  isPassword: true,
                                  icon: Icon(Icons.lock),
                                  validator: (text) {
                                    if (controller.state.password != text) {
                                      return "Las contraseñas no coinciden";
                                    }
                                    if (text!.trim().length >= 8) {
                                      return null;
                                    }
                                    return "Contraseña invalida";
                                  },
                                );
                              },
                            ),
                            SizedBox(height: 15),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 50),
                              child: ElevatedButton(
                                onPressed: () => sendRegisterForm(context),
                                child: const Text('Registrar'),
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
                            SizedBox(height: 20),
                            Column(
                              children: [
                                Logo().logo(),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.copyright),
                                    Text('  Desarrollado por DevTeam 181.')
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
