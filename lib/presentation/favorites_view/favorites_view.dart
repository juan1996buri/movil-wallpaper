import 'package:flutter/material.dart';
import 'package:wallpaper/config/themes/wallpaper.dart';

class tabItem {
  final String title;
  tabItem({required this.title});
}

List<tabItem> tabItems = [
  tabItem(title: "random"),
  tabItem(title: "popular"),
  tabItem(title: "nuevos"),
  tabItem(title: "recomendados"),
];

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: tabItems.length,
      child: Scaffold(
          backgroundColor: Wallpaper.primary,
          body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverAppBar(
                      floating: true,
                      // pinned: true,
                      snap: true,
                      backgroundColor: Wallpaper.primary,
                      title: Text("Favoritos"),
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
                      //floating: true,
                    ),
                  )
                ];
              },
              body: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 0,
                    crossAxisCount: 3,
                    mainAxisExtent: size.height / 3),
                itemBuilder: (context, index) {
                  return Container(
                      child: Image.asset(
                    "assets/spiderman.jpg",
                    fit: BoxFit.cover,
                  ));
                },
              ))),
    );
  }
}
/*


GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 0,
                  crossAxisCount: 3,
                  mainAxisExtent: size.height / 3),
              itemBuilder: (context, index) {
                return Container(
                    child: Image.asset(
                  "assets/spiderman.jpg",
                  fit: BoxFit.cover,
                ));
              },
            )

 */