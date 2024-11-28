import 'package:budget/domain/model/cash_flow_entity.dart';
import 'package:budget/domain/model/transition_type.dart';
import 'package:budget/src/core/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/model/transition_entity.dart';
part 'transition.g.dart';
@riverpod
FireTransition fireTransition(Ref ref) => FireTransition();

class FireTransition {
  late final FirebaseFirestore _firestore;
  late final CollectionReference _refProfile;
  late final CollectionReference _refVocap;

  String budgetPath(String uid) => "budget/$uid/transitions";
  String cashFlowPath(String uid) => "budget/$uid/cashFlow";

  static final FireTransition _singleton = FireTransition._internal();

  factory FireTransition() {
    return _singleton;
  }

  FireTransition._internal() {
    _firestore = FirebaseFirestore.instance;
  }
  Future<void> saveTransition({required String uid,required TransitionEntity entity}) async {
    if (uid.isEmpty) {
      throw Exception("UID must be non-null and non-empty");
    }
    var doc = _firestore.collection(budgetPath(uid)).doc();
    entity.id = doc.id;
    entity.date = DateTime.now().toString();
    _updateCashFlow(uid: uid, entity: entity);
    return await doc.set(entity.toJson(), SetOptions(merge: true));
  }

  void getTransitionList({
    required String uid,
    required Function(List<TransitionEntity> list) onSuccess,
    required Function(String msg) onFailure,
  }) {
    _firestore.collection(budgetPath(uid)).orderBy("date").snapshots().listen((data) {
      onSuccess(data.docs.map((element)=> TransitionEntity.fromJson(element.data())).toList().reversed.toList());
    }).onError((error){
      onFailure(error.toString());
    });
  }

  void getCashFlow({
    required String uid,
    required Function(CashFlowEntity entity) onSuccess,
    required Function(String msg) onFailure,
  }) {
    _firestore.collection(cashFlowPath(uid)).doc(uid).snapshots().listen((data) async {
      if(data.exists){

        Map<String, dynamic> item =  data.data() as Map<String, dynamic>;
        onSuccess(CashFlowEntity.fromJson(item));
      }else{
        onSuccess(await _saveCashFlow(uid));
      }
    }).onError((error){
      onFailure(error.toString());
    });
  }

  Future<CashFlowEntity> _saveCashFlow(String uid) async {
    var cashFlow = CashFlowEntity(id: uid, totalAmount: 0, cashIn: 0, cashOut: 0);
    await _firestore.collection(cashFlowPath(uid)).doc(uid).set(cashFlow.toJson());
    return cashFlow;
  }

  _updateCashFlow({required String uid,required TransitionEntity entity}) async {
    var doc = await _firestore.collection(cashFlowPath(uid)).doc(uid).get();
    try {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      Logger.log(msg: data.toString());
      var cashFlow = CashFlowEntity.fromJson(data);
      if (entity.type == TransitionType.cashIn) {
        cashFlow.totalAmount += entity.amount;
        cashFlow.cashIn += entity.amount;
      } else {
        cashFlow.totalAmount -= entity.amount;
        cashFlow.cashOut += entity.amount;
      }
      await _firestore.collection(cashFlowPath(uid)).doc(uid).set(cashFlow.toJson());

    }catch (e){
      Logger.log(msg: e.toString());
    }
  }

}