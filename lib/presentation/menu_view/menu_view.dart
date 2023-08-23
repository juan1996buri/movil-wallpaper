import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/config/themes/wallpaper.dart';
import 'package:wallpaper/presentation/menu_view/bloc/menu_bloc.dart';
import 'package:wallpaper/presentation/menu_view/menu_list/menu_list.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: menuTabList.length,
      child: Scaffold(
        backgroundColor: Wallpaper.primary,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                forceElevated: true,
                backgroundColor: Wallpaper.primary,
                floating: true,
                pinned: true,
                snap: true,
                title: Text("wallpaper"),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_outlined),
                  ),
                ],
                bottom: TabBar(
                  isScrollable: true,
                  tabs: List.generate(
                    menuTabList.length,
                    (index) {
                      final item = menuTabList[index];
                      return Tab(
                        child: Container(
                          child: Text(item.title),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ];
          },
          body: BlocBuilder<MenuBloc, MenuState>(
            builder: (context, state) {
              if (state is FondoErrorState) {
                return Center(
                    child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.white),
                ));
              }
              if (state is FondoLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is FondoLoadedState) {
                return TabBarView(
                  children: [
                    MenuList(fondoList: state.fondoList),
                    MenuList(fondoList: state.fondoList),
                    MenuList(fondoList: state.fondoList),
                    MenuList(fondoList: state.fondoList),
                    MenuList(fondoList: state.fondoList),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
