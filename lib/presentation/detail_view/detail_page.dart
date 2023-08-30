import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/domain/models/fondo_entity.dart';
import 'package:wallpaper/domain/repositories/fondo_repository.dart';
import 'package:wallpaper/presentation/detail_view/bloc/detail_bloc.dart';
import 'package:wallpaper/presentation/detail_view/bottom_detail/bloc/bottom_detail_bloc.dart';
import 'package:wallpaper/presentation/detail_view/detail_view.dart';
import 'package:wallpaper/presentation/detail_view/top_detail/image_page/bloc/image_page_bloc.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.fondoEntity,
    required this.elementPosition,
    this.tabItemPosition = 0,
    required this.tabNameState,
    this.nameColor = "",
  });

  final FondoEntity fondoEntity;
  final int elementPosition;
  final int? tabItemPosition;
  final TabNameState tabNameState;
  final String? nameColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => DetailBloc(
          screenHeight: size.height,
          scrollController:
              ScrollController(initialScrollOffset: size.height * .25),
        ),
      ),
      BlocProvider(
        create: (context) =>
            ImagePageBloc(fondoService: context.read<FondoRepository>())
              ..init(
                elementPosition,
                tabItemPosition!,
                nameColor!,
                tabNameState,
              )
              ..add(const ImagePageLoandingEvent()),
      ),
      BlocProvider(
        create: (context) =>
            BottomDetailBloc(fondoService: context.read<FondoRepository>())
              ..init(fondoEntity)
              ..add(
                FondosBottomLoandingEvent(),
              ),
      )
    ], child: const DetailView());
  }
}
