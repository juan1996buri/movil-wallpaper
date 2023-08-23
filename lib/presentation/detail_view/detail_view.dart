import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/config/themes/wallpaper.dart';
import 'package:wallpaper/presentation/detail_view/animated_persistent_header/animated_persistent_header.dart';
import 'package:wallpaper/presentation/detail_view/bloc/detail_bloc.dart';
import 'package:wallpaper/presentation/detail_view/bottom_detail/bottom_detail.dart';

const Duration timeDuration = Duration(milliseconds: 200);

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  void _isScrollingListener(
      BuildContext context, DetailPageDetail currentPageDetailState) async {
    if (currentPageDetailState.debounceTimer.isActive) {
      currentPageDetailState.debounceTimer.cancel();
    }

    currentPageDetailState.debounceTimer = Timer(
      Duration.zero,
      () {
        var percent =
            currentPageDetailState.scrollControllerButtom.position.pixels /
                currentPageDetailState.screenHeight;

        if (!currentPageDetailState
            .scrollControllerButtom.position.isScrollingNotifier.value) {
          if (percent > 0.53 &&
              percent <= 1.0 &&
              !currentPageDetailState.isAnimationScroll) {
            if (currentPageDetailState.wallpaperStatus ==
                WallpaperStatus.disguise) {
              context
                  .read<DetailBloc>()
                  .add(SetAnimateScrollChangeEvent(isAnimationScroll: true));
              currentPageDetailState.scrollControllerButtom
                  .animateTo(
                      currentPageDetailState.screenHeight - kToolbarHeight,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.decelerate)
                  .then((value) {
                context
                    .read<DetailBloc>()
                    .add(SetAnimateScrollChangeEvent(isAnimationScroll: false));
              });
            }
          }

          if (percent >= 0 &&
              percent < 0.53 &&
              !currentPageDetailState.isAnimationScroll) {
            if (currentPageDetailState.wallpaperStatus ==
                WallpaperStatus.disguise) {
              context
                  .read<DetailBloc>()
                  .add(SetAnimateScrollChangeEvent(isAnimationScroll: true));
              currentPageDetailState.scrollControllerButtom
                  .animateTo(
                currentPageDetailState.screenHeight * 0.25,
                duration: const Duration(milliseconds: 400),
                curve: Curves.decelerate,
              )
                  .then((value) {
                context
                    .read<DetailBloc>()
                    .add(SetAnimateScrollChangeEvent(isAnimationScroll: false));
              });
            }
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Wallpaper.primary,
      body: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          late DetailPageDetail currentPageDetailState;
          if (state is DetailPageDetail) {
            currentPageDetailState = state;
          }
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            currentPageDetailState
                .scrollControllerButtom.position.isScrollingNotifier
                .addListener(() {
              _isScrollingListener(context, currentPageDetailState);
            });
          });
          return SafeArea(
            top: currentPageDetailState.wallpaperStatus == WallpaperStatus.show
                ? false
                : true,
            child: Stack(
              children: [
                AbsorbPointer(
                  absorbing: currentPageDetailState.isAnimationScroll,
                  child: CustomScrollView(
                    physics: currentPageDetailState.wallpaperStatus ==
                            WallpaperStatus.show
                        ? const NeverScrollableScrollPhysics()
                        : const AlwaysScrollableScrollPhysics(),
                    controller: currentPageDetailState.scrollControllerButtom,
                    slivers: [
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: AnimatedSliverPersistentHeaderDelegate(
                          maxExtent: size.height,
                          minExtent: kToolbarHeight,
                          builder: (percent) {
                            return AnimatedPersistentHeader(
                              percent: percent,
                            );
                          },
                        ),
                      ),
                      const BottomDetail(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AnimatedSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  AnimatedSliverPersistentHeaderDelegate({
    required double maxExtent,
    required double minExtent,
    required this.builder,
  })  : _maxExtent = maxExtent,
        _minExtent = minExtent;

  final double _maxExtent;
  final double _minExtent;
  final Widget Function(double percent) builder;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder(shrinkOffset / _maxExtent);
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
