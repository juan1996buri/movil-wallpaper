import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/domain/models/fondo_entity.dart';
import 'package:wallpaper/domain/services/fondo_service.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final FondoService fondoService;
  MenuBloc({required this.fondoService}) : super(FondoLoadingState()) {
    on<FondoLoadedEvent>(fondoLoaded);
  }
  Future<void> fondoLoaded(
      FondoLoadedEvent event, Emitter<MenuState> emit) async {
    try {
      emit(FondoLoadingState());
      final responseFondo = await fondoService.findAll();
      emit(FondoLoadedState(responseFondo.fondoList));
    } catch (e) {
      emit(FondoErrorState(e.toString()));
    }
  }
}
