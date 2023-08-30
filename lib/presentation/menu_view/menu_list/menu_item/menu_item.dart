import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/domain/models/fondo_entity.dart';
import 'package:wallpaper/presentation/detail_view/detail_page.dart';
import 'package:wallpaper/presentation/detail_view/top_detail/image_page/bloc/image_page_bloc.dart';
import 'package:wallpaper/presentation/menu_view/bloc/menu_bloc.dart';

class MenuItem extends StatelessWidget {
  const MenuItem(
      {required this.fondoEntity, super.key, required this.elementPosition});
  final FondoEntity fondoEntity;
  final int elementPosition;
  void _handleItem(BuildContext context) {
    final tabItemPosition = context.read<MenuBloc>().tabController.index;

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return DetailPage(
          fondoEntity: fondoEntity,
          elementPosition: elementPosition,
          tabItemPosition: tabItemPosition,
          tabNameState: TabNameState.menu,
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
