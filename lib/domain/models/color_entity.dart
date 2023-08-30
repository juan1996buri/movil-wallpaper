import 'dart:convert';

List<ColorEntity> colorEntityFromJson(String str) => List<ColorEntity>.from(
    json.decode(str).map((x) => ColorEntity.fromJson(x)));

String colorEntityToJson(List<ColorEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ColorEntity {
  int id;
  String nombre;

  ColorEntity({
    required this.id,
    required this.nombre,
  });

  factory ColorEntity.fromJson(Map<String, dynamic> json) => ColorEntity(
        id: json["id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
      };
}
