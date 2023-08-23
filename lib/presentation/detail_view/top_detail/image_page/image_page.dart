import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/presentation/detail_view/bloc/detail_bloc.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return ItemImage();
      },
    );
  }
}

class ItemImage extends StatelessWidget {
  const ItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final detailBlocState = context.read<DetailBloc>().state;
        if (detailBlocState is DetailPageDetail) {
          context.read<DetailBloc>().add(
                PageItemChangeEvent(
                  isActive: !detailBlocState.isActive,
                  wallpaperStatus: WallpaperStatus.disguise,
                ),
              );
        }
      },
      child: Image.asset(
        "assets/mesi.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}
