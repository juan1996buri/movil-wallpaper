import 'dart:convert';

List<CategoryEntity> categoryEntityFromJson(String str) =>
    List<CategoryEntity>.from(
        json.decode(str).map((x) => CategoryEntity.fromJson(x)));

String categoryEntityToJson(List<CategoryEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryEntity {
  int id;
  String nombre;
  String imagenUrl;
  String publicId;
  bool estado;

  CategoryEntity({
    required this.id,
    required this.nombre,
    required this.imagenUrl,
    required this.publicId,
    required this.estado,
  });

  factory CategoryEntity.fromJson(Map<String, dynamic> json) => CategoryEntity(
        id: json["id"],
        nombre: json["nombre"],
        imagenUrl: json["imagenURL"],
        publicId: json["publicId"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "imagenURL": imagenUrl,
        "publicId": publicId,
        "estado": estado,
      };
}
