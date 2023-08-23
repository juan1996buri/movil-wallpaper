import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/domain/models/category_entity.dart';
import 'package:wallpaper/domain/services/category_service.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoryService categoryService;
  CategoriesBloc({required this.categoryService})
      : super(CategoriesLoadingState()) {
    on<LoadedCategories>(findAllCategories);
  }

  Future<void> findAllCategories(
      CategoriesEvent event, Emitter<CategoriesState> emit) async {
    emit(CategoriesLoadingState());

    try {
      final responseCategory = await categoryService.findAll();
      emit(CategoriesLoadedState(responseCategory.categoriesList));
    } catch (e) {
      emit(CategoriesErrorState(e.toString()));
    }
  }
}
