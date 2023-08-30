import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeInitial> {
  HomeBloc() : super(HomeInitial(selectedIndex: 0)) {
    on<NavigationButtomChangeEvent>(onNavigationButtom);
    on<PageNavigationChangeEvent>(onPageNavigation);
  }

  void onNavigationButtom(
      NavigationButtomChangeEvent event, Emitter<HomeInitial> emit) {
    emit(HomeInitial(selectedIndex: event.currentValue));
  }

  void onPageNavigation(
      PageNavigationChangeEvent event, Emitter<HomeInitial> emit) {
    emit(HomeInitial(selectedIndex: event.currentValue));
  }
}
