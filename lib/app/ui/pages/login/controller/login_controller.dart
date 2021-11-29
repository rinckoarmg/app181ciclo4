import 'package:flutter/widgets.dart' show FormState, GlobalKey;
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:movil181/app/domain/repositories/authentication_repository.dart';
import 'package:movil181/app/domain/responses/sing_in_responses.dart';
import 'package:movil181/app/ui/global_controllers/session_controller.dart';

class LoginController extends SimpleNotifier {
  final SessionController _sessionController;
  String _email = '';
  String _password = '';
  final _authRepository = Get.i.find<AuthenticationRepository>();

  final GlobalKey<FormState> formKey = GlobalKey();

  LoginController(this._sessionController);

  void onEmailChanged(String text) {
    _email = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }

  Future<SingInResponse> submit() async {
    final response =
        await _authRepository.singInWithEmailAndPassword(_email, _password);
    if (response.error == null) {
      _sessionController.setUser(response.user!);
    }
    return response;
  }
}
