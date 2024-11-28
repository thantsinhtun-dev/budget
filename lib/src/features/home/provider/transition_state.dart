
import '../../../../domain/model/transition_entity.dart';

sealed class TransitionState{}

class TransitionInitialState extends TransitionState{}
class TransitionSuccessState extends TransitionState{
  List<TransitionEntity> list;
  TransitionSuccessState(this.list);
}
