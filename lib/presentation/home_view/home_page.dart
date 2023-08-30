import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/domain/repositories/category_repository.dart';
import 'package:wallpaper/domain/repositories/fondo_repository.dart';
import 'package:wallpaper/presentation/categories_view/bloc/categories_bloc.dart';
import 'package:wallpaper/presentation/categories_view/color_view/bloc/color_bloc.dart';
import 'package:wallpaper/presentation/home_view/bloc/home_bloc.dart';
import 'package:wallpaper/presentation/home_view/home_view.dart';
import 'package:wallpaper/presentation/menu_view/bloc/menu_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => MenuBloc(
            fondoService: context.read<FondoRepository>(),
          )
            ..init(this)
            ..add(FondoLoadedEvent()),
        ),
        BlocProvider(
          create: (context) => ColorBloc(
            fondoService: context.read<FondoRepository>(),
          )
            ..init(this)
            ..add(
              const ColorFondoLoadingEvent(colorName: "amarillo"),
            ),
        ),
        BlocProvider(
          create: (context) => CategoriesBloc(
              categoryService: context.read<CategoryRepository>())
            ..add(
              const LoadedCategoriesEvent(),
            ),
        ),
      ],
      child: const HomeView(),
    );
  }
}
