part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class NavigationButtomChangeEvent extends HomeEvent {
  NavigationButtomChangeEvent({required this.currentValue});
  final int currentValue;
}

class PageNavigationChangeEvent extends HomeEvent {
  PageNavigationChangeEvent({required this.currentValue});
  final int currentValue;
}
