import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:movil181/app/data/repositories_impl/account_repository_impl.dart';
import 'package:movil181/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:movil181/app/data/repositories_impl/sing_up_repository_impl.dart';
import 'package:movil181/app/domain/repositories/account_repository.dart';
import 'package:movil181/app/domain/repositories/authentication_repository.dart';

import 'domain/repositories/sing_up_repository.dart';

void injectDependencies() {
  Get.i.lazyPut<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(FirebaseAuth.instance),
  );
  Get.i.lazyPut<SignUpRepository>(
    () => SingUpRepositoryImpl(FirebaseAuth.instance),
  );
  Get.i.lazyPut<AccountRepository>(
      () => AccountRepositoryImpl(FirebaseAuth.instance));
}
