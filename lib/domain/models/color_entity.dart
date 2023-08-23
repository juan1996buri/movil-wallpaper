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
