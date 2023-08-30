import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/domain/models/fondo_entity.dart';
import 'package:wallpaper/presentation/detail_view/bloc/detail_bloc.dart';
import 'package:wallpaper/presentation/detail_view/bottom_detail/bloc/bottom_detail_bloc.dart';
import 'package:wallpaper/presentation/detail_view/top_detail/image_page/bloc/image_page_bloc.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagePageBloc, ImagePageState>(
      builder: (context, state) {
        if (state is ImagePageFondoLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ImagePageFondoLoadedState) {
          return PageView.builder(
            itemCount: state.fondosList.length,
            controller: PageController(
                initialPage: context.watch<ImagePageBloc>().elementPosition),
            scrollDirection: Axis.horizontal,
            onPageChanged: (value) {
              final fondoEntity = state.fondosList[value];
              final bottomblocRead = context.read<BottomDetailBloc>()
                ..init(fondoEntity);
              bottomblocRead.add(
                FondosBottomLoandingEvent(),
              );
            },
            itemBuilder: (context, index) {
              final fondoEntity = state.fondosList[index];
              return ItemImage(fondoEntity: fondoEntity);
            },
          );
        }
        if (state is ImagePageFondoErrorState) {
          return Center(
              child: Text(
            state.message,
            style: const TextStyle(color: Colors.white),
          ));
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class ItemImage extends StatelessWidget {
  const ItemImage({
    super.key,
    required this.fondoEntity,
  });
  final FondoEntity fondoEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final detailBlocState = context.read<DetailBloc>().state;
        context.read<DetailBloc>().add(
              PageItemChangeEvent(
                isActive: !detailBlocState.isActive,
                wallpaperStatus: WallpaperStatus.disguise,
              ),
            );
      },
      child: Image.network(
        fondoEntity.imagenUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
