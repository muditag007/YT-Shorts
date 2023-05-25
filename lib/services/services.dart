// ignore_for_file: prefer_final_fields, unused_import, invalid_required_positional_param, unnecessary_brace_in_string_interps, prefer_interpolation_to_compose_strings, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:yt_shorts/models/shorts.dart';

class ApiServices {
  // Map<String, String> _headers = {
  //   "x-rapidapi-key": 'c24a7a07b5msh9e201872fa3bfc3p1e3a7djsnd8853141e445',
  //   "x-rapidapi-host": "moviesdatabase.p.rapidapi.com",
  // };
  final String pageNum;
  ApiServices({required this.pageNum});
  String endpoint =
      'https://internship-service.onrender.com/videos?page=';

  Future<ShortsList> getInfo(String num) async {
    final response = await http.get(
      Uri.parse(endpoint+num),
    );
    if (response.statusCode == 200) {
      return ShortsList.fromJson(json.decode(response.body));
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final shortsProvider =
    Provider<ApiServices>((ref) => ApiServices(pageNum:'5'));
