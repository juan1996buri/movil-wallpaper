import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/prueba/bloc/prueba_bloc.dart';

class PruebaView extends StatelessWidget {
  const PruebaView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PruebaBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prueba view"),
      ),
    );
  }
}
