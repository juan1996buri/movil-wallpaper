import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/domain/repositories/fondo_repository.dart';
import 'package:wallpaper/prueba/bloc/prueba_bloc.dart';
import 'package:wallpaper/prueba/prueba_repository.dart';
import 'package:wallpaper/prueba/prueba_view.dart';

class PruebaPage extends StatelessWidget {
  const PruebaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PruebaBloc(
        pruebaRepositoryImp: context.read<PruebaRepository>(),
        fondoService: context.read<FondoRepository>(),
      ),
      child: PruebaView(),
    );
  }
}
