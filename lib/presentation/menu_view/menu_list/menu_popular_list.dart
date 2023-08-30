import 'package:flutter/material.dart';
import 'package:wallpaper/domain/models/popular_entity.dart';
import 'package:wallpaper/presentation/menu_view/menu_list/menu_item/menu_item.dart';

class MenuPupularList extends StatelessWidget {
  const MenuPupularList({super.key, required this.popularList});
  final List<PopularEntity> popularList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GridView.builder(
      shrinkWrap: true,
      itemCount: popularList.length,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          mainAxisExtent: size.height / 3),
      itemBuilder: (context, index) {
        final fondoEntity = popularList[index].fondo;

        return MenuItem(
          fondoEntity: fondoEntity,
          elementPosition: index,
        );
      },
    );
  }
}
