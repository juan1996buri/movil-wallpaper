part of 'detail_bloc.dart';

enum WallpaperStatus {
  show,
  disguise,
}

@immutable
abstract class DetailState extends Equatable {}

class DetailPageDetail extends DetailState {
  DetailPageDetail({
    required this.wallpaperStatus,
    required this.isActive,
    required this.screenHeight,
    required this.isAnimationScroll,
    required this.scrollControllerButtom,
    required this.optionsHeightBottom,
    required this.debounceTimer,
  });
  final ScrollController scrollControllerButtom;
  final double optionsHeightBottom;

  final bool isActive;
  final WallpaperStatus wallpaperStatus;
  final double screenHeight;
  final bool isAnimationScroll;
  Timer debounceTimer;

  DetailPageDetail copyWith({
    bool? isActive,
    WallpaperStatus? wallpaperStatus,
    double? screenHeight,
    bool? isAnimationScroll,
    double? optionsHeightBottom,
  }) {
    return DetailPageDetail(
        isActive: isActive ?? this.isActive,
        wallpaperStatus: wallpaperStatus ?? this.wallpaperStatus,
        screenHeight: screenHeight ?? this.screenHeight,
        isAnimationScroll: isAnimationScroll ?? this.isAnimationScroll,
        scrollControllerButtom: scrollControllerButtom,
        debounceTimer: debounceTimer,
        optionsHeightBottom: optionsHeightBottom ?? this.optionsHeightBottom);
  }

  void dispose() {
    scrollControllerButtom.dispose();
  }

  @override
  List<Object?> get props => [
        isActive,
        wallpaperStatus,
        screenHeight,
        isAnimationScroll,
        scrollControllerButtom,
        debounceTimer,
        optionsHeightBottom
      ];
}

class FondosFirstElementByIdLoadingState extends DetailState {
  @override
  List<Object?> get props => [];
}

class FondosFirstElementByIdLoadState extends DetailState {
  FondosFirstElementByIdLoadState({required this.fondosFirtElementByIDList});
  final List<FondoEntity> fondosFirtElementByIDList;
  @override
  List<Object?> get props => [fondosFirtElementByIDList];
}

class FondosFirtElementByIdErrorState extends DetailState {
  final String messageFirtElementById;
  FondosFirtElementByIdErrorState({required this.messageFirtElementById});
  @override
  List<Object?> get props => [messageFirtElementById];
}
