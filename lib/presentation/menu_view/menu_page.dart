import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/domain/repositories/fondo_repository.dart';
import 'package:wallpaper/presentation/menu_view/bloc/menu_bloc.dart';
import 'package:wallpaper/presentation/menu_view/menu_view.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MenuBloc(fondoService: context.read<FondoRepository>())
            ..add(FondoLoadedEvent()),
      child: const MenuView(),
    );
  }
}
