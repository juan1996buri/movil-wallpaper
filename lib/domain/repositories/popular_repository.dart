import 'dart:convert';

import 'package:wallpaper/domain/models/popular_entity.dart';
import 'package:wallpaper/domain/models/response_entity.dart';
import 'package:wallpaper/domain/services/popular_service.dart';
import 'package:http/http.dart' as http;

const url = "http://192.168.100.18:4000/api/v1/popular/";

class PopularRepository implements PopularService {
  @override
  Future<ResponsePopularMany> findAll() async {
    final responsejson = await http.get(Uri.parse('${url}actives'));
    final popularList = popularEntityFromJson(
      jsonEncode(jsonDecode(responsejson.body)["data"]),
    );

    final responseEntity = responseEntityFromJson(responsejson.body);
    return ResponsePopularMany(
      fondosList: popularList,
      responseEntity: responseEntity,
    );
  }
}
