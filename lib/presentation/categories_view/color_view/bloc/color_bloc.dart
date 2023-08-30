import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/domain/models/fondo_entity.dart';
import 'package:wallpaper/domain/services/fondo_service.dart';

part 'color_event.dart';
part 'color_state.dart';

class TabItem {
  final String title;
  final Color color;
  TabItem({required this.title, required this.color});
}

List<TabItem> tabItems = [
  TabItem(title: "todo", color: Colors.yellow),
  TabItem(title: "amarillo", color: Colors.yellow),
  TabItem(title: "azul", color: Colors.blue),
  TabItem(title: "blanco", color: Colors.white),
  TabItem(title: "gris", color: Colors.grey),
  TabItem(title: "marrón", color: Colors.brown),
  TabItem(title: "morado", color: Colors.purple),
  TabItem(title: "naranja", color: Colors.orange),
  TabItem(title: "negro", color: Colors.black),
  TabItem(title: "rojo", color: Colors.red),
  TabItem(title: "rosa", color: Colors.pink),
  TabItem(title: "verde", color: Colors.green),
];

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  final FondoService fondoService;
  late TabController tabController;

  ColorBloc({required this.fondoService}) : super(ColorFondoLoadingState()) {
    on<ColorFondoLoadingEvent>(onColorFondoLoadingEvent);
  }

  Future<void> onColorFondoLoadingEvent(
      ColorFondoLoadingEvent event, Emitter<ColorState> emit) async {
    try {
      emit(ColorFondoLoadingState());
      final response = await fondoService.findAllParams(
          options: OptionsFindAll(color: event.colorName));
      emit(ColorFondoLoadedState(fondosList: response.fondosList));
    } catch (e) {
      emit(ColorFondoErrorState(message: e.toString()));
    }
  }

  void init(TickerProvider tickerProvider) {
    tabController =
        TabController(length: tabItems.length, vsync: tickerProvider);
  }
}
