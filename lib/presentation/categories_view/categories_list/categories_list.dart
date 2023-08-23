import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/domain/models/category_entity.dart';
import 'package:wallpaper/presentation/categories_view/bloc/categories_bloc.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesErrorState) {
          return Text(state.message);
        }
        if (state is CategoriesLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CategoriesLoadedState) {
          final categoriesList = state.categoriesList;
          return CategoriesGrid(
            categoriesList: categoriesList,
          );
        }
        return Container();
      },
    );
  }
}

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key, required this.categoriesList});

  final List<CategoryEntity> categoriesList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GridView.builder(
      itemCount: categoriesList.length,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: size.height / 6.5,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemBuilder: (context, index) {
        final categoryItem = categoriesList[index];
        return Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Image.network(
                    categoryItem.imagenUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 5,
                  bottom: 5,
                  child: Text(
                    categoryItem.nombre,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
