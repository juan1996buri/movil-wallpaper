import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/domain/repositories/fondo_repository.dart';
import 'package:wallpaper/domain/services/fondo_service.dart';
import 'package:wallpaper/presentation/detail_view/bloc/detail_bloc.dart';
import 'package:wallpaper/presentation/detail_view/detail_view.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.fondoId,
  });

  final int fondoId;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => DetailBloc(
        fondoService: context.read<FondoRepository>(),
        screenHeight: size.height,
        scrollController:
            ScrollController(initialScrollOffset: size.height * .25),
      ),
      child: DetailView(),
    );
  }
}
