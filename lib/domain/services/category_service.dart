import 'package:wallpaper/domain/models/category_entity.dart';
import 'package:wallpaper/domain/models/response_entity.dart';

abstract class CategoryService {
  Future<ReponseCategory> findAll();
}

class ReponseCategory {
  final ResponseEntity responseEntity;
  final List<CategoryEntity> categoriesList;
  ReponseCategory(this.responseEntity, this.categoriesList);
}
