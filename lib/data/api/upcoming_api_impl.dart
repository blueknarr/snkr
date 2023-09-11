import 'dart:convert';

import 'package:snkr/data/dto/Upcoming_dto.dart';
import 'package:snkr/domain/api/upcoming_api.dart';
import 'package:http/http.dart' as http;

class UpcomingApiImpl implements UpcomingApi {
  @override
  Future<List<UpcomingDto>> getUpcomingProducts() async {
    final http.Response response =
        await http.get(Uri.parse('http://34.83.124.114/v1/upcoming'));

    final responseBody = jsonDecode(utf8.decode(response.bodyBytes));

    if (responseBody['status'] != 200) {
      throw 'Http Status Code : ${responseBody["status"]}';
    }

    final List<dynamic> jsonList = responseBody['result'];

    return jsonList.map((e) => UpcomingDto.fromJson(e)).toList();
  }
}
