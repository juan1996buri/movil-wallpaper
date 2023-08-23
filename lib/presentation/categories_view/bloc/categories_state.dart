part of 'categories_bloc.dart';

@immutable
abstract class CategoriesState extends Equatable {}

class CategoriesLoadingState extends CategoriesState {
  @override
  List<Object?> get props => [];
}

class CategoriesLoadedState extends CategoriesState {
  final List<CategoryEntity> categoriesList;
  CategoriesLoadedState(this.categoriesList);
  @override
  List<Object?> get props => [categoriesList];
}

class CategoriesErrorState extends CategoriesState {
  CategoriesErrorState(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}
