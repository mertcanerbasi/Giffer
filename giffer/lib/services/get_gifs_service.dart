import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:giffer/models/gif_model.dart';

class GifService {
  Future<List<Map<String, Media>?>?> getHttp({required String query}) async {
    try {
      final response = await Dio().get('https://g.tenor.com/v1/search?q=$query&key=HNNSY63OI4W2&limit=10');

      GifModel x = GifModel.fromJson(response.data);
      List<Map<String, Media>>? _urls = [];
      x.results?.forEach((e) {
        _urls.add(e.media![0]);
      });

      return _urls;
    } catch (e) {
      print(e);
    }
  }
}
