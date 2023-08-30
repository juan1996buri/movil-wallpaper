import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/domain/models/fondo_entity.dart';
import 'package:wallpaper/domain/services/fondo_service.dart';

part 'bottom_detail_event.dart';
part 'bottom_detail_state.dart';

class BottomDetailBloc extends Bloc<BottomDetailEvent, BottomDetailState> {
  final FondoService fondoService;
  late FondoEntity fondoEntity;

  BottomDetailBloc({required this.fondoService})
      : super(FondosBottomLoandingState()) {
    on<FondosBottomLoandingEvent>(onFondosBottomLoanding);
  }

  Future<void> onFondosBottomLoanding(
      FondosBottomLoandingEvent event, Emitter<BottomDetailState> emit) async {
    try {
      emit(FondosBottomLoandingState());
      final response = await fondoService.findAllParams(
          options: OptionsFindAll(
              categoryName: fondoEntity.fondoCategoria[0].categoria.nombre));
      emit(FondosBottomLoadedState(fondosList: response.fondosList));
    } catch (e) {
      emit(FondosBottomErrosState(message: e.toString()));
    }
  }

  void init(FondoEntity fondoEntity) {
    this.fondoEntity = fondoEntity;
  }
}
