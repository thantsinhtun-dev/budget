import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/firebase/auth.dart';
import '../../src/core/error_handler.dart';
import '../model/user_entity.dart';
import 'auth_repository_impl.dart';

part 'auth_repostitory.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  final _authRemote = ref.read(authFirebaseProvider);

  return AuthRepositoryImpl(_authRemote,);
}

abstract class AuthRepository {
  ResultFuture<UserEntity> googleLogin();
  ResultFuture<UserEntity> getCurrentUser();
  ResultFuture<String> userLogout();


}