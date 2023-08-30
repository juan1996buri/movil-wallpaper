part of 'image_page_bloc.dart';

@immutable
abstract class ImagePageState extends Equatable {
  const ImagePageState();
}

class ImagePageFondoLoadingState extends ImagePageState {
  @override
  List<Object?> get props => [];
}

class ImagePageFondoLoadedState extends ImagePageState {
  final List<FondoEntity> fondosList;

  const ImagePageFondoLoadedState({
    required this.fondosList,
  });

  @override
  List<Object?> get props => [fondosList];
}

class ImagePageFondoErrorState extends ImagePageState {
  const ImagePageFondoErrorState(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}
