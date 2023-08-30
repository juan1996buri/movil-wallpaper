part of 'bottom_detail_bloc.dart';

@immutable
abstract class BottomDetailEvent extends Equatable {
  const BottomDetailEvent();
}

class FondosBottomLoandingEvent extends BottomDetailEvent {
  @override
  List<Object?> get props => [];
}
