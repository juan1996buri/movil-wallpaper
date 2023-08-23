import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/config/themes/wallpaper.dart';
import 'package:wallpaper/presentation/detail_view/bloc/detail_bloc.dart';
import 'package:wallpaper/presentation/detail_view/top_detail/image_page/image_page.dart';

const Duration timeDuration = Duration(milliseconds: 200);

List<String> options = [
  "Pantalla de inicio",
  "Pantalla de bloqueo",
  "Pantalla de inicio & Pantalla de bloqueo"
];

class AnimatedPersistentHeader extends StatelessWidget {
  const AnimatedPersistentHeader({super.key, required this.percent});

  final double percent;

  Color _changeColorAppBar(DetailPageDetail detailPageDetailState) {
    return detailPageDetailState.wallpaperStatus == WallpaperStatus.show
        ? Wallpaper.primary
        : Wallpaper.primary.withOpacity((percent / 0.85).clamp(0, 1));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) {
        late DetailPageDetail detailPageDetailState;
        if (state is DetailPageDetail) {
          detailPageDetailState = state;
        }
        return Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: size.height,
              child: ImagePage(),
            ),
            AnimatedPositioned(
              bottom: detailPageDetailState.optionsHeightBottom,
              right: 0,
              left: 0,
              duration: timeDuration,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: Icon(
                      Icons.download,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        color: _changeColorAppBar(detailPageDetailState),
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 250,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 10),
                                const Text(
                                  'Establecer como:',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Column(
                                  children: options
                                      .asMap()
                                      .map((index, option) {
                                        return MapEntry(
                                          index,
                                          CheckboxListTile(
                                            value: true,
                                            //     _selectedValue ==
                                            //         index,
                                            onChanged: (value) {
                                              //setState(() {
                                              // if (value) {
                                              //   _selectedValue =
                                              //       index;
                                              // } else {
                                              //   _selectedValue =
                                              //       -1;
                                              // }
                                              // });
                                            },
                                            title: Text(option),
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                          ),
                                        );
                                      })
                                      .values
                                      .toList(),
                                ),
                                Row(
                                  children: [
                                    Spacer(),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text("CANCELAR"),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text("ACEPTAR"),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.mobile_screen_share,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          color: Wallpaper.primary.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: timeDuration,
              top: 0,
              left: 0,
              right: 0,
              height: detailPageDetailState.isActive ? kToolbarHeight : 0,
              child: SafeArea(
                child: ClipRect(
                  child: AnimatedContainer(
                    duration: timeDuration,
                    color: _changeColorAppBar(detailPageDetailState),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
