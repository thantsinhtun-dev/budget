import 'package:budget/domain/repostsitory/auth_repostitory.dart';
import 'package:budget/src/features/auth/provider/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  late AuthRepository _authRepository;

  @override
  AuthState build() {
    _initProvider();
    return AuthInitialState();
  }

  _initProvider() {
    _authRepository = ref.read(authRepositoryProvider);
  }

  Future<void> checkLoginState(Function() onSuccess) async {
    var result = await _authRepository.getCurrentUser();
    result.fold(
      (error) {
        state = AuthLoginState();
      },
      (entity) {
        onSuccess();
      },
    );
  }

  Future<void> googleLogin({
    required Function() onSuccess,
    required Function(String title, String msg) onFailure,
  }) async {
    var result = await _authRepository.googleLogin();
    result.fold(
      (error) => onFailure("Error!",error.toString()),
      (entity) => onSuccess(),
    );
  }
}
