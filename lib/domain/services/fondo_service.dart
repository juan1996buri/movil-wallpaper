import 'package:wallpaper/domain/models/fondo_entity.dart';
import 'package:wallpaper/domain/models/response_entity.dart';

abstract class FondoService {
  Future<ResponseFondoMany> findAll();
  Future<ResponseFondoOne> findById({required int fondoId});
}

class ResponseFondoMany {
  ResponseFondoMany({required this.fondoList, required this.responseEntity});
  final List<FondoEntity> fondoList;
  final ResponseEntity responseEntity;
}

class ResponseFondoOne {
  ResponseFondoOne({required this.fondoEntity, required this.responseEntity});
  final FondoEntity fondoEntity;
  final ResponseEntity responseEntity;
}
