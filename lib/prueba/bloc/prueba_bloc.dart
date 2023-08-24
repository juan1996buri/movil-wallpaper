import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wallpaper/domain/services/fondo_service.dart';
import 'package:wallpaper/prueba/prueba_repository_imp.dart';

part 'prueba_event.dart';
part 'prueba_state.dart';

class PruebaBloc extends Bloc<PruebaEvent, PruebaState> {
  final PruebaRepositoryImp pruebaRepositoryImp;
  final FondoService fondoService;
  PruebaBloc({required this.pruebaRepositoryImp, required this.fondoService})
      : super(PruebaInitial()) {
    on<PruebaEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
