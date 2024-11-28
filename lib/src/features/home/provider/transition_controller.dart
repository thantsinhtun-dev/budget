import 'package:budget/domain/model/transition_entity.dart';
import 'package:budget/src/core/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../domain/repostsitory/transition_repository.dart';
import 'transition_state.dart';

part 'transition_controller.g.dart';

@riverpod
class TransitionController extends _$TransitionController {
  late TransitionRepository _transitionRepo;

  @override
  TransitionState build() {
    _initProvider();
    return TransitionInitialState();
  }

  _initProvider() {
    _transitionRepo = ref.read(transitionRepositoryProvider);
  }

  void getTransitions() {
    _transitionRepo.getTransition(
      onSuccess: (list) {
        state = TransitionSuccessState(list);
      },
      onFailure: (error) {
        Logger.log(msg: error.toString());
      },
    );
  }

  Future<void> addTransition(TransitionEntity entity, Function onSuccess) async {
    var result = await _transitionRepo.addTransition(entity: entity);
    result.fold(
      (e) {
        Logger.log(msg: e.toString());
      },
      (msg) {
        onSuccess();
      },
    );
  }
}
