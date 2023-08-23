// To parse this JSON data, do
//
//     final fondoEntity = fondoEntityFromJson(jsonString);

import 'dart:convert';

import 'package:wallpaper/domain/models/color_entity.dart';
import 'package:wallpaper/domain/models/fondo_categoria_entity.dart';

List<FondoEntity> fondoEntityFromJson(String str) => List<FondoEntity>.from(
    json.decode(str).map((x) => FondoEntity.fromJson(x)));

String fondoEntityToJson(List<FondoEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FondoEntity {
  int id;
  String imagenUrl;
  String publicId;
  DateTime fechaCrea;
  bool estado;
  bool recomendado;
  ColorEntity color;
  List<FondoCategoriaEntity> fondoCategoria;

  FondoEntity({
    required this.id,
    required this.imagenUrl,
    required this.publicId,
    required this.fechaCrea,
    required this.estado,
    required this.recomendado,
    required this.color,
    required this.fondoCategoria,
  });

  factory FondoEntity.fromJson(Map<String, dynamic> json) => FondoEntity(
        id: json["id"],
        imagenUrl: json["imagenURL"],
        publicId: json["publicId"],
        fechaCrea: DateTime.parse(json["fechaCrea"]),
        estado: json["estado"],
        recomendado: json["recomendado"],
        color: ColorEntity.fromJson(json["color"]),
        fondoCategoria: List<FondoCategoriaEntity>.from(json["fondoCategoria"]
            .map((x) => FondoCategoriaEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imagenURL": imagenUrl,
        "publicId": publicId,
        "fechaCrea": fechaCrea.toIso8601String(),
        "estado": estado,
        "recomendado": recomendado,
        "color": color.toJson(),
        "fondoCategoria":
            List<dynamic>.from(fondoCategoria.map((x) => x.toJson())),
      };
}
