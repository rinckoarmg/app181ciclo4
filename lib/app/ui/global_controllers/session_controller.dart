import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:movil181/app/domain/repositories/authentication_repository.dart';

class SessionController extends SimpleNotifier {
  User? _user;
  User? get user => _user;

  final _auth = Get.i.find<AuthenticationRepository>();

  void setUser(User user) {
    _user = user;
    notify();
  }

  Future<void> singOut() async {
    await _auth.signOut();
    _user = null;
  }

  // @override
  // void dispose() {
  //   print('object');
  //   super.dispose();
  // }
}

final sessionProvider = SimpleProvider(
  (_) => SessionController(),
  autoDispose: false,
);
