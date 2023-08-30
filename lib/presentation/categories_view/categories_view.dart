import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/config/themes/wallpaper.dart';
import 'package:wallpaper/domain/models/fondo_entity.dart';
import 'package:wallpaper/presentation/categories_view/bloc/categories_bloc.dart';
import 'package:wallpaper/presentation/categories_view/categories_list/categories_list.dart';
import 'package:wallpaper/presentation/categories_view/color_view/bloc/color_bloc.dart';
import 'package:wallpaper/presentation/detail_view/detail_page.dart';
import 'package:wallpaper/presentation/detail_view/top_detail/image_page/bloc/image_page_bloc.dart';
import 'package:wallpaper/presentation/menu_view/menu_list/menu_list.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabItems.length,
      child: Scaffold(
        backgroundColor: Wallpaper.primary,
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Wallpaper.primary,
              floating: true,
              pinned: true,
              snap: true,
              title: Text("Categories"),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert_outlined),
                ),
              ],
              bottom: TabBar(
                isScrollable: true,
                controller: context.read<ColorBloc>().tabController,
                onTap: (value) {
                  if (value > 0) {
                    TabItem tabItem = tabItems[value];
                    context
                        .read<ColorBloc>()
                        .add(ColorFondoLoadingEvent(colorName: tabItem.title));
                  }
                },
                tabs: List.generate(tabItems.length, (index) {
                  final item = tabItems[index];
                  return Tab(
                    child: Container(
                      child: Text(item.title),
                    ),
                  );
                }),
              ),
            ),
          ];
        }, body: BlocBuilder<ColorBloc, ColorState>(
          builder: (context, state) {
            if (state is ColorFondoLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ColorFondoLoadedState) {
              return TabBarView(
                controller: context.read<ColorBloc>().tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const CategoriesList(),
                  ColorList(fondoList: state.fondosList),
                  ColorList(fondoList: state.fondosList),
                  ColorList(fondoList: state.fondosList),
                  ColorList(fondoList: state.fondosList),
                  ColorList(fondoList: state.fondosList),
                  ColorList(fondoList: state.fondosList),
                  ColorList(fondoList: state.fondosList),
                  ColorList(fondoList: state.fondosList),
                  ColorList(fondoList: state.fondosList),
                  ColorList(fondoList: state.fondosList),
                  ColorList(fondoList: state.fondosList),
                ],
              );
            }
            return Container();
          },
        )),
      ),
    );
  }
}

class ColorList extends StatelessWidget {
  const ColorList({super.key, required this.fondoList});
  final List<FondoEntity> fondoList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GridView.builder(
      shrinkWrap: true,
      itemCount: fondoList.length,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          mainAxisExtent: size.height / 3),
      itemBuilder: (context, index) {
        final fondoEntity = fondoList[index];

        return ColorItem(
          fondoEntity: fondoEntity,
          elementPosition: index,
        );
      },
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem(
      {required this.fondoEntity, super.key, required this.elementPosition});
  final FondoEntity fondoEntity;
  final int elementPosition;
  void _handleItem(BuildContext context) {
    final tabItemPosition = context.read<ColorBloc>().tabController.index;
    TabItem tabItem = tabItems[tabItemPosition];
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return DetailPage(
          fondoEntity: fondoEntity,
          nameColor: tabItem.title,
          tabNameState: TabNameState.categories,
          elementPosition: elementPosition,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _handleItem(context);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          fondoEntity.imagenUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
