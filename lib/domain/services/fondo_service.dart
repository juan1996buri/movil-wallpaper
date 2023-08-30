import 'package:wallpaper/domain/models/fondo_entity.dart';
import 'package:wallpaper/domain/models/response_entity.dart';

abstract class FondoService {
//  Future<ResponseFondoMany> findAll();
  Future<ResponseFondoMany> findAllParams({OptionsFindAll? options});
}

class OptionsFindAll {
  final String? categoryName;
  final bool? recommended;
  final bool? newItems;
  final String? color;

  OptionsFindAll({
    this.categoryName = "",
    this.recommended = false,
    this.newItems = false,
    this.color = "",
  });
}

class ResponseFondoMany {
  ResponseFondoMany({required this.fondosList, required this.responseEntity});
  final List<FondoEntity> fondosList;
  final ResponseEntity responseEntity;
}

class ResponseFondoOne {
  ResponseFondoOne({required this.fondoEntity, required this.responseEntity});
  final FondoEntity fondoEntity;
  final ResponseEntity responseEntity;
}
