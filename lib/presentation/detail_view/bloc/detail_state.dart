part of 'detail_bloc.dart';

enum WallpaperStatus {
  show,
  disguise,
}

class DetailPageDetailState extends Equatable {
  DetailPageDetailState({
    required this.wallpaperStatus,
    required this.isActive,
    required this.screenHeight,
    required this.isAnimationScroll,
    required this.scrollControllerBottom,
    required this.optionsHeightBottom,
    required this.debounceTimer,
  });
  final ScrollController scrollControllerBottom;
  final double optionsHeightBottom;

  final bool isActive;
  final WallpaperStatus wallpaperStatus;
  final double screenHeight;
  final bool isAnimationScroll;
  Timer debounceTimer;

  DetailPageDetailState copyWith({
    bool? isActive,
    WallpaperStatus? wallpaperStatus,
    double? screenHeight,
    bool? isAnimationScroll,
    double? optionsHeightBottom,
  }) {
    return DetailPageDetailState(
        isActive: isActive ?? this.isActive,
        wallpaperStatus: wallpaperStatus ?? this.wallpaperStatus,
        screenHeight: screenHeight ?? this.screenHeight,
        isAnimationScroll: isAnimationScroll ?? this.isAnimationScroll,
        scrollControllerBottom: scrollControllerBottom,
        debounceTimer: debounceTimer,
        optionsHeightBottom: optionsHeightBottom ?? this.optionsHeightBottom);
  }

  void dispose() {
    scrollControllerBottom.dispose();
  }

  @override
  List<Object?> get props => [
        isActive,
        wallpaperStatus,
        screenHeight,
        isAnimationScroll,
        scrollControllerBottom,
        debounceTimer,
        optionsHeightBottom
      ];
}
