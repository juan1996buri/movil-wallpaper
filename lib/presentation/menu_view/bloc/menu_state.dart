part of 'menu_bloc.dart';

@immutable
abstract class MenuState extends Equatable {}

class FondoLoadingState extends MenuState {
  @override
  List<Object?> get props => [];
}

class FondoLoadedState extends MenuState {
  final List<FondoEntity> fondosTotalList;
  final List<FondoEntity> fondosNewList;
  final List<FondoEntity> fondosRecommendedList;

  FondoLoadedState({
    required this.fondosTotalList,
    required this.fondosNewList,
    required this.fondosRecommendedList,
  });

  @override
  List<Object?> get props =>
      [fondosTotalList, fondosNewList, fondosRecommendedList];
}

class FondoErrorState extends MenuState {
  FondoErrorState(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}
