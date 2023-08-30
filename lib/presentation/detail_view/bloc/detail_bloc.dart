import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailPageDetailState> {
  final double screenHeight;
  ScrollController scrollController;
  DetailBloc({
    required this.screenHeight,
    required this.scrollController,
  }) : super(DetailPageDetailState(
          optionsHeightBottom: 10,
          scrollControllerBottom: scrollController,
          screenHeight: screenHeight,
          isAnimationScroll: false,
          isActive: true,
          wallpaperStatus: WallpaperStatus.disguise,
          debounceTimer: Timer(Duration.zero, () {}),
        )) {
    on<PageItemChangeEvent>(onPageItemChangeEvent);
    on<SetAnimateScrollChangeEvent>(onSetAnimateScrollChangeEvent);
    on<StateBottomDetailChangeEvent>(onStateBottomDetailChangeEvent);
    on<SetOptionsHeightBottomChangeEvent>(onSetOptionsHeightBottomChangeEvent);
  }

  void onSetOptionsHeightBottomChangeEvent(
      SetOptionsHeightBottomChangeEvent event,
      Emitter<DetailPageDetailState> emit) {
    final result =
        state.copyWith(optionsHeightBottom: event.optionsHeightBottom);
    emit(
      DetailPageDetailState(
        wallpaperStatus: result.wallpaperStatus,
        isActive: result.isActive,
        screenHeight: result.screenHeight,
        isAnimationScroll: result.isAnimationScroll,
        scrollControllerBottom: result.scrollControllerBottom,
        optionsHeightBottom: result.optionsHeightBottom,
        debounceTimer: result.debounceTimer,
      ),
    );
  }

  void onStateBottomDetailChangeEvent(
      StateBottomDetailChangeEvent event, Emitter<DetailPageDetailState> emit) {
    final result = state.copyWith(
        isActive: true, wallpaperStatus: WallpaperStatus.disguise);
    emit(
      DetailPageDetailState(
        scrollControllerBottom: result.scrollControllerBottom,
        isAnimationScroll: result.isAnimationScroll,
        screenHeight: result.screenHeight,
        isActive: result.isActive,
        wallpaperStatus: result.wallpaperStatus,
        optionsHeightBottom: result.optionsHeightBottom,
        debounceTimer: result.debounceTimer,
      ),
    );
  }

  void onPageItemChangeEvent(
      PageItemChangeEvent event, Emitter<DetailPageDetailState> emit) {
    final result = state.copyWith(
        wallpaperStatus:
            event.isActive! ? WallpaperStatus.disguise : WallpaperStatus.show,
        isActive: event.isActive!,
        optionsHeightBottom: event.isActive! ? 10 : -50);
    if (!event.isActive!) {
      state.scrollControllerBottom.animateTo(0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.decelerate);
    } else {
      state.scrollControllerBottom.animateTo(state.screenHeight * 0.25,
          duration: const Duration(milliseconds: 200),
          curve: Curves.decelerate);
    }
    emit(
      DetailPageDetailState(
        scrollControllerBottom: result.scrollControllerBottom,
        isAnimationScroll: result.isAnimationScroll,
        screenHeight: result.screenHeight,
        isActive: result.isActive,
        wallpaperStatus: result.wallpaperStatus,
        optionsHeightBottom: result.optionsHeightBottom,
        debounceTimer: result.debounceTimer,
      ),
    );
  }

  void onSetAnimateScrollChangeEvent(
      SetAnimateScrollChangeEvent event, Emitter<DetailPageDetailState> emit) {
    final result = state.copyWith(isAnimationScroll: event.isAnimationScroll);
    emit(
      DetailPageDetailState(
        scrollControllerBottom: result.scrollControllerBottom,
        wallpaperStatus: result.wallpaperStatus,
        isActive: result.isActive,
        screenHeight: result.screenHeight,
        isAnimationScroll: result.isAnimationScroll,
        optionsHeightBottom: result.optionsHeightBottom,
        debounceTimer: result.debounceTimer,
      ),
    );
  }

  @override
  Future<void> close() {
    state.dispose();
    return super.close();
  }
}
