import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/domain/repositories/category_repository.dart';
import 'package:wallpaper/domain/repositories/fondo_repository.dart';
import 'package:wallpaper/domain/repositories/popular_repository.dart';
import 'package:wallpaper/presentation/home_view/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          RepositoryProvider(
            create: (context) => FondoRepository(),
          ),
          RepositoryProvider(
            create: (context) => CategoryRepository(),
          ),
          RepositoryProvider(
            create: (context) => PopularRepository(),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ));
  }
}
