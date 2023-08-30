import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/domain/models/category_entity.dart';
import 'package:wallpaper/domain/models/fondo_entity.dart';
import 'package:wallpaper/domain/services/fondo_service.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuTabItem {
  final String title;
  MenuTabItem({required this.title});
}

List<MenuTabItem> menuTabList = [
  MenuTabItem(title: "todo"),
  MenuTabItem(title: "nuevos"),
  MenuTabItem(title: "recomendados"),
];

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final FondoService fondoService;
  late TabController tabController;
  //final PopularService popularService;
  MenuBloc({required this.fondoService}) : super(FondoLoadingState()) {
    on<FondoLoadedEvent>(fondoLoaded);
  }
  Future<void> fondoLoaded(
      FondoLoadedEvent event, Emitter<MenuState> emit) async {
    try {
      emit(FondoLoadingState());
      final responseTotal =
          await fondoService.findAllParams(options: OptionsFindAll());
      final responseNew = await fondoService.findAllParams(
          options: OptionsFindAll(newItems: true));
      final responseRecommended = await fondoService.findAllParams(
          options: OptionsFindAll(recommended: true));
      emit(
        FondoLoadedState(
          fondosTotalList: responseTotal.fondosList,
          fondosNewList: responseNew.fondosList,
          fondosRecommendedList: responseRecommended.fondosList,
        ),
      );
    } catch (e) {
      emit(FondoErrorState(e.toString()));
    }
  }

  void init(TickerProvider tickerProvider) {
    tabController =
        TabController(length: menuTabList.length, vsync: tickerProvider);
  }
}
