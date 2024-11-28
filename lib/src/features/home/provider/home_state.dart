import 'package:budget/domain/model/cash_flow_entity.dart';

sealed class HomeState{}

class HomeInitialState extends HomeState{}
class HomeSuccessState extends HomeState{
  CashFlowEntity entity;
  HomeSuccessState(this.entity);
}