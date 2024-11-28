import 'package:budget/data/firebase/transition.dart';
import 'package:budget/domain/model/cash_flow_entity.dart';
import 'package:budget/domain/repostsitory/transition_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/firebase/auth.dart';
import '../../src/core/error_handler.dart';
import '../model/transition_entity.dart';

part 'transition_repository.g.dart';

@riverpod
TransitionRepository transitionRepository(Ref ref) {
  final _authRemote = ref.read(authFirebaseProvider);
  final _transition = ref.read(fireTransitionProvider);
  return TransitionRepositoryImpl(_transition,_authRemote);
}

abstract class TransitionRepository {
  ResultFuture<String> addTransition({required TransitionEntity entity});


  void getTransition({
    required Function(List<TransitionEntity> list) onSuccess,
    required Function(String msg) onFailure,
  });

  void getCashFlow({
    required Function(CashFlowEntity list) onSuccess,
    required Function(String msg) onFailure,
  });

}
