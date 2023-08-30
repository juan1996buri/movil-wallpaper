import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/domain/models/fondo_entity.dart';
import 'package:wallpaper/domain/services/fondo_service.dart';
import 'package:wallpaper/presentation/detail_view/bloc/detail_bloc.dart';

part 'image_page_event.dart';
part 'image_page_state.dart';

enum TabNameState {
  categories,
  menu,
}

class ImagePageBloc extends Bloc<ImagePageEvent, ImagePageState> {
  final FondoService fondoService;
  int tabItemPosition = 0;
  int elementPosition = 0;
  String nameColor = "";
  late TabNameState tabNameState;
  ImagePageBloc({required this.fondoService})
      : super(ImagePageFondoLoadingState()) {
    on<ImagePageLoandingEvent>(onImagePageLoandingEvent);
    on<ImagePageBottomLoandingEvent>(onImagePageBottomLoandingEvent);
  }

  Future<void> onImagePageBottomLoandingEvent(
      ImagePageBottomLoandingEvent event, Emitter<ImagePageState> emit) async {
    try {
      emit(ImagePageFondoLoadingState());
      final response = await fondoService.findAllParams(
        options: OptionsFindAll(
          categoryName: event.fondoEntity.fondoCategoria[0].categoria.nombre,
          newItems: false,
          recommended: false,
        ),
      );

      emit(
        ImagePageFondoLoadedState(
          fondosList: response.fondosList,
        ),
      );
    } catch (e) {
      emit(ImagePageFondoErrorState(e.toString()));
    }
  }

  Future<void> onImagePageLoandingEvent(
      ImagePageLoandingEvent event, Emitter<ImagePageState> emit) async {
    try {
      emit(ImagePageFondoLoadingState());
      late ResponseFondoMany response;
      if (tabNameState == TabNameState.menu) {
        if (tabItemPosition == 0) {
          response = await fondoService.findAllParams(
              options: OptionsFindAll(
                  categoryName: "", newItems: false, recommended: false));
        } else if (tabItemPosition == 1) {
          response = await fondoService.findAllParams(
              options: OptionsFindAll(
                  categoryName: "", newItems: true, recommended: false));
        } else if (tabItemPosition == 2) {
          response = await fondoService.findAllParams(
              options: OptionsFindAll(
                  categoryName: "", newItems: false, recommended: true));
        }
      }
      if (tabNameState == TabNameState.categories) {
        response = await fondoService.findAllParams(
            options: OptionsFindAll(categoryName: "", color: nameColor));
      }

      emit(
        ImagePageFondoLoadedState(
          fondosList: response.fondosList,
        ),
      );
    } catch (e) {
      emit(ImagePageFondoErrorState(e.toString()));
    }
  }

  void init(int elementPosition, int tabItemPosition, String nameColor,
      TabNameState tabNameState) {
    this.elementPosition = elementPosition;
    this.tabItemPosition = tabItemPosition;
    this.nameColor = nameColor;
    this.tabNameState = tabNameState;
  }
}
