import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/config/themes/wallpaper.dart';
import 'package:wallpaper/presentation/categories_view/categories_view.dart';
import 'package:wallpaper/presentation/favorites_view/favorites_view.dart';
import 'package:wallpaper/presentation/home_view/bloc/home_bloc.dart';
import 'package:wallpaper/presentation/menu_view/menu_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const List<Widget> _widgetOptions = [
    MenuView(),
    CategoriesView(),
    FavoritesView(),
  ];

  void handleTap(int currentValue, BuildContext context) {
    context
        .read<HomeBloc>()
        .add(NavigationButtomChangeEvent(currentValue: currentValue));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeInitial>(
        builder: (_, state) {
          return _widgetOptions.elementAt(state.selectedIndex);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Wallpaper.selectedIcon,
        unselectedItemColor: Wallpaper.unselectedIcon,
        backgroundColor: Wallpaper.primary,
        currentIndex: context.watch<HomeBloc>().state.selectedIndex,
        onTap: (value) {
          handleTap(value, context);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.gas_meter_rounded,
            ),
            label: "menu",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "favorito"),
        ],
      ),
    );
  }
}
