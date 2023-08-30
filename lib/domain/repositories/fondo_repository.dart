import 'dart:convert';

import 'package:wallpaper/domain/models/fondo_entity.dart';
import 'package:wallpaper/domain/models/response_entity.dart';
import 'package:wallpaper/domain/services/fondo_service.dart';
import 'package:http/http.dart' as http;

const url = "http://192.168.100.18:4000/api/v1/fondo/";

class FondoRepository implements FondoService {
  @override
  Future<ResponseFondoMany> findAllParams({OptionsFindAll? options}) async {
    final Map<String, String> queryParams = {};
    if (options!.categoryName!.isNotEmpty) {
      queryParams['categoryName'] = options.categoryName!;
    }
    if (options.recommended!) {
      queryParams['recomendado'] = "true";
    }

    if (options.newItems!) {
      queryParams['nuevo'] = "true";
    }
    if (options.color!.isNotEmpty) {
      queryParams['color'] = options.color!;
    }

    final responsejson = await http
        .get(Uri.parse('${url}activos').replace(queryParameters: queryParams));
    final fondoList =
        fondoEntityFromJson(jsonEncode(jsonDecode(responsejson.body)["data"]));
    final responseEntity = responseEntityFromJson(responsejson.body);
    return ResponseFondoMany(
        fondosList: fondoList, responseEntity: responseEntity);
  }

  // @override
  // Future<ResponseFondoMany> findAll({OptionsFindAll? options}) async {
  //   final responsejson = await http.get(Uri.parse('${url}activos'));
  //   final fondoList =
  //       fondoEntityFromJson(jsonEncode(jsonDecode(responsejson.body)["data"]));

  //   final responseEntity = responseEntityFromJson(responsejson.body);
  //   return ResponseFondoMany(
  //       fondosList: fondoList, responseEntity: responseEntity);
  // }
}
