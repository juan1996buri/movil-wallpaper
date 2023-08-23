import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/config/themes/wallpaper.dart';
import 'package:wallpaper/presentation/categories_view/bloc/categories_bloc.dart';
import 'package:wallpaper/presentation/categories_view/categories_list/categories_list.dart';
import 'package:wallpaper/presentation/menu_view/menu_list/menu_list.dart';

class TabItem {
  final String title;
  final Color color;
  TabItem({required this.title, required this.color});
}

List<TabItem> tabItems = [
  TabItem(title: "todo", color: Colors.yellow),
  TabItem(title: "amarillo", color: Colors.yellow),
  TabItem(title: "azul", color: Colors.blue),
  TabItem(title: "blanco", color: Colors.white),
  TabItem(title: "gris", color: Colors.grey),
  TabItem(title: "marrón", color: Colors.brown),
  TabItem(title: "morado", color: Colors.purple),
  TabItem(title: "naranja", color: Colors.orange),
  TabItem(title: "negro", color: Colors.black),
  TabItem(title: "rojo", color: Colors.red),
  TabItem(title: "rosa", color: Colors.pink),
  TabItem(title: "verde", color: Colors.green),
];

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabItems.length,
      child: Scaffold(
          backgroundColor: Wallpaper.primary,
          body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: Wallpaper.primary,
                    floating: true,
                    pinned: true,
                    snap: true,
                    title: Text("Categories"),
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert_outlined),
                      ),
                    ],
                    bottom: TabBar(
                      isScrollable: true,
                      tabs: List.generate(tabItems.length, (index) {
                        final item = tabItems[index];
                        return Tab(
                          child: Container(
                            child: Text(item.title),
                          ),
                        );
                      }),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  CategoriesList(),
                  MenuList(fondoList: []),
                  MenuList(fondoList: []),
                  MenuList(fondoList: []),
                  MenuList(fondoList: []),
                  MenuList(fondoList: []),
                  MenuList(fondoList: []),
                  MenuList(fondoList: []),
                  MenuList(fondoList: []),
                  MenuList(fondoList: []),
                  MenuList(fondoList: []),
                  MenuList(fondoList: []),
                ],
              ))),
    );
  }
}

//CategoriesList(),
