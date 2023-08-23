import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/domain/repositories/category_repository.dart';
import 'package:wallpaper/domain/repositories/fondo_repository.dart';
import 'package:wallpaper/domain/services/category_service.dart';
import 'package:wallpaper/domain/services/fondo_service.dart';
import 'package:wallpaper/presentation/home_view/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          RepositoryProvider<FondoService>(
            create: (context) => FondoRepository(),
          ),
          RepositoryProvider<CategoryService>(
            create: (context) => CategoryRepository(),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
