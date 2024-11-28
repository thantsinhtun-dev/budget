import 'package:budget/src/core/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../domain/repostsitory/auth_repostitory.dart';
import 'profile_state.dart';

part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  late AuthRepository _authRepository;

  @override
  ProfileState build() {
    _initProvider();
    return ProfileInitialState();
  }

  _initProvider() {
    _authRepository = ref.read(authRepositoryProvider);
  }

  Future<void> getProfile() async {
    var result = await _authRepository.getCurrentUser();
    result.fold(
      (error) {
        state = ProfileInitialState();
      },
      (entity) {
        state = ProfileSuccessState(entity);
      },
    );
  }

  Future<void> logout(Function onSuccess) async {
    var result = await _authRepository.userLogout();
    result.fold(
      (e) => Logger.log(msg: e.toString()),
      (msg) {onSuccess();},
    );
  }
}
