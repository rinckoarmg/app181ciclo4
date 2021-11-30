import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:movil181/app/domain/repositories/sing_up_repository.dart';
import 'package:movil181/app/domain/responses/sing_up_responses.dart';
import 'package:movil181/app/domain/use_cases/sing_up.dart';
import 'package:movil181/app/ui/global_controllers/session_controller.dart';
import 'package:movil181/app/ui/pages/register/controller/register_state.dart';

class RegisterController extends StateNotifier<RegisterState> {
  final SessionController _sessionController;
  RegisterController(this._sessionController)
      : super(RegisterState.initialState);
  final GlobalKey<FormState> formKey = GlobalKey();
  final _singUpRepository = Get.i.find<SignUpRepository>();

  Future<SingUpResponse> submit() async {
    final response = await _singUpRepository.register(
      SingUpData(
        email: state.email,
        name: state.name,
        password: state.password,
      ),
    );

    if (response.error == null) {
      _sessionController.setUser(response.user!);
    }
    return response;
  }

  void onNameChanged(String text) {
    state = state.copyWith(name: text);
  }

  void onEmailChanged(String text) {
    state = state.copyWith(email: text);
  }

  void onPasswordChanged(String text) {
    state = state.copyWith(password: text);
  }

  void onVPasswordChanged(String text) {
    state = state.copyWith(vpassword: text);
  }
}
