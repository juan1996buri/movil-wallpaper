import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/domain/models/fondo_entity.dart';
import 'package:wallpaper/domain/services/fondo_service.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final FondoService fondoService;
  DetailBloc({
    required this.fondoService,
    required double screenHeight,
    required ScrollController scrollController,
  }) : super(DetailPageDetail(
          optionsHeightBottom: 10,
          scrollControllerButtom: scrollController,
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
    on<FindAllFirtElementByIdEvent>(onFindAllFondoFirtElementById);
  }

  Future<void> onFindAllFondoFirtElementById(
      FindAllFirtElementByIdEvent event, Emitter<DetailState> emit) async {
    try {
      emit(FondosFirstElementByIdLoadingState());
      final result = await fondoService.findAllFirtElemetById(fondoId: 8);

      emit(FondosFirstElementByIdLoadState(
          fondosFirtElementByIDList: result.fondoList));
    } catch (e) {
      if (FindAllFirtElementByIdEvent is FondosFirtElementByIdErrorState) {
        emit(FondosFirtElementByIdErrorState(
            messageFirtElementById: e.toString()));
      }
    }
  }

  void onSetOptionsHeightBottomChangeEvent(
      SetOptionsHeightBottomChangeEvent event, Emitter<DetailState> emit) {
    if (state is DetailPageDetail) {
      DetailPageDetail currentPageDetail = state as DetailPageDetail;
      final result = currentPageDetail.copyWith(
          optionsHeightBottom: event.optionsHeightBottom);
      emit(
        DetailPageDetail(
          wallpaperStatus: result.wallpaperStatus,
          isActive: result.isActive,
          screenHeight: result.screenHeight,
          isAnimationScroll: result.isAnimationScroll,
          scrollControllerButtom: result.scrollControllerButtom,
          optionsHeightBottom: result.optionsHeightBottom,
          debounceTimer: result.debounceTimer,
        ),
      );
    }
  }

  void onStateBottomDetailChangeEvent(
      StateBottomDetailChangeEvent event, Emitter<DetailState> emit) {
    if (state is DetailPageDetail) {
      DetailPageDetail currentPageDetail = state as DetailPageDetail;
      final result = currentPageDetail.copyWith(
          isActive: true, wallpaperStatus: WallpaperStatus.disguise);
      emit(
        DetailPageDetail(
          scrollControllerButtom: result.scrollControllerButtom,
          isAnimationScroll: result.isAnimationScroll,
          screenHeight: result.screenHeight,
          isActive: result.isActive,
          wallpaperStatus: result.wallpaperStatus,
          optionsHeightBottom: result.optionsHeightBottom,
          debounceTimer: result.debounceTimer,
        ),
      );
    }
  }

  void onPageItemChangeEvent(
      PageItemChangeEvent event, Emitter<DetailState> emit) {
    if (state is DetailPageDetail) {
      DetailPageDetail currentPageDetail = state as DetailPageDetail;
      final result = currentPageDetail.copyWith(
          wallpaperStatus:
              event.isActive! ? WallpaperStatus.disguise : WallpaperStatus.show,
          isActive: event.isActive!,
          optionsHeightBottom: event.isActive! ? 10 : -50);
      if (!event.isActive!) {
        currentPageDetail.scrollControllerButtom.animateTo(0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.decelerate);
      } else {
        currentPageDetail.scrollControllerButtom.animateTo(
            currentPageDetail.screenHeight * 0.25,
            duration: const Duration(milliseconds: 200),
            curve: Curves.decelerate);
      }
      emit(
        DetailPageDetail(
          scrollControllerButtom: result.scrollControllerButtom,
          isAnimationScroll: result.isAnimationScroll,
          screenHeight: result.screenHeight,
          isActive: result.isActive,
          wallpaperStatus: result.wallpaperStatus,
          optionsHeightBottom: result.optionsHeightBottom,
          debounceTimer: result.debounceTimer,
        ),
      );
    }
  }

  void onSetAnimateScrollChangeEvent(
      SetAnimateScrollChangeEvent event, Emitter<DetailState> emit) {
    if (state is DetailPageDetail) {
      DetailPageDetail currentPageDetail = state as DetailPageDetail;
      final result = currentPageDetail.copyWith(
          isAnimationScroll: event.isAnimationScroll);
      emit(
        DetailPageDetail(
          scrollControllerButtom: result.scrollControllerButtom,
          wallpaperStatus: result.wallpaperStatus,
          isActive: result.isActive,
          screenHeight: result.screenHeight,
          isAnimationScroll: result.isAnimationScroll,
          optionsHeightBottom: result.optionsHeightBottom,
          debounceTimer: result.debounceTimer,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    if (state is DetailPageDetail) {
      DetailPageDetail currentPageDetail = state as DetailPageDetail;
      currentPageDetail.dispose();
    }
    return super.close();
  }
}
