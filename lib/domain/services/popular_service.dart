import 'package:wallpaper/domain/models/popular_entity.dart';
import 'package:wallpaper/domain/models/response_entity.dart';

abstract class PopularService {
  Future<ResponsePopularMany> findAll();
}

class ResponsePopularMany {
  ResponsePopularMany({required this.fondosList, required this.responseEntity});
  final List<PopularEntity> fondosList;
  final ResponseEntity responseEntity;
}
