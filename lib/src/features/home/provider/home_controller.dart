import 'package:budget/src/core/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../domain/repostsitory/transition_repository.dart';
import 'home_state.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  late TransitionRepository _transitionRepo;

  @override
  HomeState build() {
    _initProvider();
    return HomeInitialState();
  }

  _initProvider() {
    _transitionRepo = ref.read(transitionRepositoryProvider);
  }

  void getCashFlow() {
    _transitionRepo.getCashFlow(
      onSuccess: (entity) {
        state = HomeSuccessState(entity);
      },
      onFailure: (error) {
        Logger.log(msg: error.toString());
      },
    );
  }
}
