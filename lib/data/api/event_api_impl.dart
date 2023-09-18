import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:snkr/data/dto/event_dto.dart';
import 'package:snkr/domain/api/event_api.dart';
import 'package:http/http.dart' as http;

@singleton
class EventApiImpl implements EventApi {
  @override
  Future<List<EventDto>> getEvents() async {
    final http.Response response =
        await http.get(Uri.parse('http://34.83.124.114/v1/event'));

    final responseBody = jsonDecode(response.body);

    if (responseBody['status'] != 200) {
      throw 'Http Status Code : ${responseBody["status"]}';
    }

    final List<dynamic> jsonList = responseBody['result'];
    return jsonList.map((e) => EventDto.fromJson(e)).toList();
  }
}
