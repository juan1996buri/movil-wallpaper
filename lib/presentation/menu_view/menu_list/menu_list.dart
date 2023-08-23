import 'package:flutter/material.dart';
import 'package:wallpaper/domain/models/fondo_entity.dart';
import 'package:wallpaper/presentation/menu_view/menu_list/menu_item/menu_item.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key, required this.fondoList});
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
        return MenuItem(
          fondoEntity: fondoEntity,
        );
      },
    );
  }
}
