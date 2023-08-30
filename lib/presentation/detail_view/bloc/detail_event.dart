part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent extends Equatable {}

class PageItemChangeEvent extends DetailEvent {
  PageItemChangeEvent({this.isActive, required this.wallpaperStatus});
  final bool? isActive;
  final WallpaperStatus wallpaperStatus;

  @override
  List<Object?> get props => [isActive, wallpaperStatus];
}

class DetailInitialEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class StateBottomDetailChangeEvent extends DetailEvent {
  @override
  List<Object?> get props => [];
}

class SetAnimateScrollChangeEvent extends DetailEvent {
  SetAnimateScrollChangeEvent({required this.isAnimationScroll});
  final bool isAnimationScroll;
  @override
  List<Object?> get props => [isAnimationScroll];
}

class SetOptionsHeightBottomChangeEvent extends DetailEvent {
  final double optionsHeightBottom;
  SetOptionsHeightBottomChangeEvent({required this.optionsHeightBottom});
  @override
  List<Object?> get props => [optionsHeightBottom];
}

class FindAllFirtElementByIdEvent extends DetailEvent {
  FindAllFirtElementByIdEvent();
  @override
  List<Object?> get props => [];
}
