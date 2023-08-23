part of 'menu_bloc.dart';

class MenuTabItem {
  final String title;
  MenuTabItem({required this.title});
}

List<MenuTabItem> menuTabList = [
  MenuTabItem(title: "random"),
  MenuTabItem(title: "popular"),
  MenuTabItem(title: "nuevos"),
  MenuTabItem(title: "ai art"),
  MenuTabItem(title: "recomendados"),
];

@immutable
abstract class MenuState extends Equatable {}

class FondoLoadingState extends MenuState {
  @override
  List<Object?> get props => [];
}

class FondoLoadedState extends MenuState {
  final List<FondoEntity> fondoList;
  FondoLoadedState(this.fondoList);
  @override
  List<Object?> get props => [fondoList];
}

class FondoErrorState extends MenuState {
  FondoErrorState(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}
