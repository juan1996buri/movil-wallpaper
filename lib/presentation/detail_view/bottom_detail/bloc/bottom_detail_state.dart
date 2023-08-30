part of 'bottom_detail_bloc.dart';

@immutable
abstract class BottomDetailState extends Equatable {
  const BottomDetailState();
}

class FondosBottomLoandingState extends BottomDetailState {
  @override
  List<Object?> get props => [];
}

class FondosBottomLoadedState extends BottomDetailState {
  final List<FondoEntity> fondosList;
  const FondosBottomLoadedState({required this.fondosList});
  @override
  List<Object?> get props => [];
}

class FondosBottomErrosState extends BottomDetailState {
  final String message;

  const FondosBottomErrosState({required this.message});
  @override
  List<Object?> get props => [];
}
