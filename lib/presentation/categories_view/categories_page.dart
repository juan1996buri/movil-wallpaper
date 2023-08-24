import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/domain/repositories/category_repository.dart';
import 'package:wallpaper/domain/services/category_service.dart';
import 'package:wallpaper/presentation/categories_view/bloc/categories_bloc.dart';
import 'package:wallpaper/presentation/categories_view/categories_view.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoriesBloc(categoryService: context.read<CategoryRepository>())
            ..add(LoadedCategories()),
      child: const CategoriesView(),
    );
  }
}
