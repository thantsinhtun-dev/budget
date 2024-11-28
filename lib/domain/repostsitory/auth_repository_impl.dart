

import 'package:fpdart/fpdart.dart';

import '../../data/firebase/auth.dart';
import '../../src/core/error_handler.dart';
import '../model/user_entity.dart';
import 'auth_repostitory.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthFirebase _authFirebase;
  AuthRepositoryImpl(this._authFirebase);

  @override
  ResultFuture<UserEntity> getCurrentUser() async {
    try {
      var user = _authFirebase.getCurrentUser();
      var userEntity = UserEntity(
        name: user?.displayName ?? "",
        email: user?.email ?? "",
        image: user?.photoURL ?? "",
        phoneNumber: user?.phoneNumber ?? "",
        uid: user?.uid ?? "",
        token: "",
        autoSync: false,
        isDarkMode: false,

      );
      return user != null
          ? Right(userEntity)
          : Left(ErrorHandler.otherException("Fail to get user info"));
    } on Exception catch (e) {
      return Left(ErrorHandler.otherException(e));
    } catch (e) {
      return Left(ErrorHandler.catchException(e));
    }
  }

  @override
  ResultFuture<UserEntity> googleLogin() async {
    try {
      var user = await _authFirebase.googleLogin();
      var userEntity = UserEntity(
        name: user.user?.displayName ?? "",
        email: user.user?.email ?? "",
        image: user.user?.photoURL ?? "",
        phoneNumber: user.user?.phoneNumber ?? "",
        uid: user.user?.uid ?? "",
        token: user.credential?.accessToken ?? "",
      );
      return Right(userEntity);
    } on Exception catch (e) {
      return Left(ErrorHandler.otherException(e));
    } catch (e) {
      return Left(ErrorHandler.catchException(e));
    }
  }

  @override
  ResultFuture<String> userLogout() async {
    try {
      await _authFirebase.logout();
      return const Right("Logout Success!");
    } on Exception catch (e) {
      return Left(ErrorHandler.otherException(e));
    }
  }
}