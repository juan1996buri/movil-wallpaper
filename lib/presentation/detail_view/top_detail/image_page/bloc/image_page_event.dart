part of 'image_page_bloc.dart';

@immutable
abstract class ImagePageEvent extends Equatable {
  const ImagePageEvent();
}

class ImagePageLoandingEvent extends ImagePageEvent {
  const ImagePageLoandingEvent();

  @override
  List<Object?> get props => [];
}

class ImagePageBottomLoandingEvent extends ImagePageEvent {
  final FondoEntity fondoEntity;

  const ImagePageBottomLoandingEvent({required this.fondoEntity});
  @override
  List<Object?> get props => [fondoEntity];
}
