part of 'color_bloc.dart';

@immutable
abstract class ColorState extends Equatable {
  const ColorState();
}

class ColorFondoLoadingState extends ColorState {
  @override
  List<Object?> get props => [];
}

class ColorFondoLoadedState extends ColorState {
  final List<FondoEntity> fondosList;

  const ColorFondoLoadedState({required this.fondosList});
  @override
  List<Object?> get props => [fondosList];
}

class ColorFondoErrorState extends ColorState {
  final String message;
  const ColorFondoErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
