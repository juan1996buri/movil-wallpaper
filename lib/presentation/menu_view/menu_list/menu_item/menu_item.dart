import 'package:flutter/material.dart';
import 'package:wallpaper/domain/models/fondo_entity.dart';
import 'package:wallpaper/presentation/detail_view/detail_page.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({required this.fondoEntity, super.key});
  final FondoEntity fondoEntity;
  void _handleItem(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return DetailPage(
          fondoId: fondoEntity.id,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleItem(context),
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
