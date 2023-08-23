import 'dart:convert';

import 'package:wallpaper/domain/models/fondo_entity.dart';
import 'package:wallpaper/domain/models/response_entity.dart';
import 'package:wallpaper/domain/services/fondo_service.dart';
import 'package:http/http.dart' as http;

const url = "http://localhost:4000/api/v1/fondo/";

class FondoRepository implements FondoService {
  @override
  Future<ResponseFondoMany> findAll() async {
    final responsejson = await http.get(Uri.parse(url));

    final fondoList =
        fondoEntityFromJson(jsonEncode(jsonDecode(responsejson.body)["data"]));
    final responseEntity = responseEntityFromJson(responsejson.body);
    return ResponseFondoMany(
        fondoList: fondoList, responseEntity: responseEntity);
  }

  @override
  Future<ResponseFondoOne> findById({required int fondoId}) async {
    final responsejson = await http.get(Uri.parse('$url$fondoId'));
    final responseEntity = responseEntityFromJson(responsejson.body);
    final fondoEntity =
        FondoEntity.fromJson(jsonDecode(responsejson.body)["data"]);

    print(jsonEncode(fondoEntity));

    return ResponseFondoOne(
        fondoEntity: fondoEntity, responseEntity: responseEntity);
  }
}
