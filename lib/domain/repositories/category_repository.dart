import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper/domain/models/category_entity.dart';
import 'package:wallpaper/domain/models/response_entity.dart';
import '../services/category_service.dart';

const url = "http://localhost:4000/api/v1/categoria";

List<CategoryEntity> categories = [
  CategoryEntity(
    id: 1,
    nombre: "nombre 1",
    imagenUrl: "imagenUrl",
    publicId: "publicId",
    estado: false,
  ),
  CategoryEntity(
    id: 2,
    nombre: "nombre 2",
    imagenUrl: "imagenUrl",
    publicId: "publicId",
    estado: false,
  )
];

class CategoryRepository implements CategoryService {
  @override
  Future<ReponseCategory> findAll() async {
    try {
      final response = await http.get(Uri.parse(url));
      final responseEntity = ResponseEntity.fromJson(jsonDecode(response.body));
      final categoriesList =
          categoryEntityFromJson(jsonEncode(jsonDecode(response.body)["data"]));
      return ReponseCategory(responseEntity, categoriesList);
    } catch (e) {
      throw Error();
    }
  }
}
