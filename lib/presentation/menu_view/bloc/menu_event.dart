part of 'menu_bloc.dart';

@immutable
abstract class MenuEvent {}

class FondoLoadedEvent extends MenuEvent {
  final CategoryEntity? categoryEntity;
  FondoLoadedEvent({
    this.categoryEntity,
  });
}
