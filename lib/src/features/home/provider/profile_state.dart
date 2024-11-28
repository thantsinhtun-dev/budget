import 'package:budget/domain/model/user_entity.dart';

sealed class ProfileState{}

class ProfileInitialState extends ProfileState {}
class ProfileSuccessState extends ProfileState {
  UserEntity entity;
  ProfileSuccessState(this.entity);
}