import 'package:wallpaper/domain/models/category_entity.dart';

class FondoCategoriaEntity {
  int id;
  CategoryEntity categoria;

  FondoCategoriaEntity({
    required this.id,
    required this.categoria,
  });

  factory FondoCategoriaEntity.fromJson(Map<String, dynamic> json) =>
      FondoCategoriaEntity(
        id: json["id"],
        categoria: CategoryEntity.fromJson(json["categoria"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoria": categoria.toJson(),
      };
}
