import 'package:budget/data/firebase/auth.dart';
import 'package:budget/domain/model/cash_flow_entity.dart';
import 'package:budget/domain/model/transition_entity.dart';

import 'package:budget/src/core/error_handler.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/firebase/transition.dart';
import 'transition_repository.dart';

class TransitionRepositoryImpl extends TransitionRepository {
  final FireTransition _fireTransition;
  final AuthFirebase _authFirebase;

  TransitionRepositoryImpl(this._fireTransition, this._authFirebase);

  @override
  ResultFuture<String> addTransition({required TransitionEntity entity}) async {
    try {
      var uid = _authFirebase.getCurrentUser()?.uid ?? "";
      await _fireTransition.saveTransition(uid: uid, entity: entity);
      return const Right("Success");
    } catch (e) {
      return Left(ErrorHandler.otherException(e.toString()));
    }
  }

  @override
  void getCashFlow({
    required Function(CashFlowEntity list) onSuccess,
    required Function(String msg) onFailure,
  }) {
    try {
      var uid = _authFirebase.getCurrentUser()?.uid ?? "";
      _fireTransition.getCashFlow(uid: uid, onSuccess: onSuccess, onFailure: onFailure);
    } catch (e) {
      onFailure(e.toString());
    }
  }

  @override
  void getTransition({
    required Function(List<TransitionEntity> list) onSuccess,
    required Function(String msg) onFailure,
  }) {
    try {
      var uid = _authFirebase.getCurrentUser()?.uid ?? "";
      _fireTransition.getTransitionList(uid: uid, onSuccess: onSuccess, onFailure: onFailure);
    } catch (e) {
      onFailure(e.toString());
    }
  }
}
