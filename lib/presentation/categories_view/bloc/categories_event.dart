part of 'categories_bloc.dart';

@immutable
abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();
}

class LoadedCategories extends CategoriesEvent {
  @override
  List<Object?> get props => [];
}
