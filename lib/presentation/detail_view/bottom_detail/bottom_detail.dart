import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/domain/models/fondo_entity.dart';
import 'package:wallpaper/presentation/detail_view/bottom_detail/bloc/bottom_detail_bloc.dart';
import 'package:wallpaper/presentation/detail_view/top_detail/image_page/bloc/image_page_bloc.dart';

class BottomDetail extends StatelessWidget {
  const BottomDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<BottomDetailBloc, BottomDetailState>(
      builder: (context, state) {
        if (state is FondosBottomLoandingState) {
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is FondosBottomLoadedState) {
          return SliverGrid.builder(
            itemCount: state.fondosList.length < 7
                ? state.fondosList.length + 9
                : state.fondosList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: size.height / 3,
            ),
            itemBuilder: (context, index) {
              if (index >= 0 && index < state.fondosList.length) {
                return BottomDetailItem(
                  fondoEntity: state.fondosList[index],
                  elementPosition: index,
                );
              }
              return const SizedBox();
            },
          );
        }

        if (state is FondosBottomErrosState) {
          return SliverFillRemaining(
            child: Center(
              child: Text(state.message.toString()),
            ),
          );
        }

        return const SliverFillRemaining();
      },
    );
  }
}

class BottomDetailItem extends StatelessWidget {
  const BottomDetailItem(
      {super.key, required this.fondoEntity, required this.elementPosition});
  final FondoEntity fondoEntity;
  final int elementPosition;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final tabItemPosition = context.read<ImagePageBloc>().tabItemPosition;
        final nameColor = context.read<ImagePageBloc>().nameColor;
        final tabNameState = context.read<ImagePageBloc>().tabNameState;
        final fondoEntity = context.read<BottomDetailBloc>().fondoEntity;
        context.read<ImagePageBloc>()
          ..init(
            elementPosition,
            tabItemPosition,
            nameColor,
            tabNameState,
          )
          ..add(ImagePageBottomLoandingEvent(fondoEntity: fondoEntity));
      },
      child: Image.network(
        fondoEntity.imagenUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
