import 'dart:convert';

import 'package:wallpaper/domain/models/fondo_entity.dart';

List<PopularEntity> popularEntityFromJson(String str) =>
    List<PopularEntity>.from(
        json.decode(str).map((x) => PopularEntity.fromJson(x)));

String popularEntityToJson(List<PopularEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PopularEntity {
  int id;
  DateTime fecha;
  int cantidad;
  FondoEntity fondo;

  PopularEntity({
    required this.id,
    required this.fecha,
    required this.cantidad,
    required this.fondo,
  });

  factory PopularEntity.fromJson(Map<String, dynamic> json) => PopularEntity(
        id: json["id"],
        fecha: DateTime.parse(json["fecha"]),
        cantidad: json["cantidad"],
        fondo: FondoEntity.fromJson(json["fondo"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fecha": fecha.toIso8601String(),
        "cantidad": cantidad,
        "fondo": fondo.toJson(),
      };
}
