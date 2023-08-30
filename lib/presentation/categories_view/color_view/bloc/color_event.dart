part of 'color_bloc.dart';

@immutable
abstract class ColorEvent extends Equatable {
  const ColorEvent();
}

class ColorFondoLoadingEvent extends ColorEvent {
  final String colorName;
  const ColorFondoLoadingEvent({required this.colorName});
  @override
  List<Object?> get props => [];
}
