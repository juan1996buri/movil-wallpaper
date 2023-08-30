part of 'categories_bloc.dart';

@immutable
abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();
}

class LoadedCategoriesEvent extends CategoriesEvent {
  const LoadedCategoriesEvent();
  @override
  List<Object?> get props => [];
}
