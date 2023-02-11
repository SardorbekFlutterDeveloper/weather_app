import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ob_havo_app/models/weather_api_model.dart';


class WeatherService {
  static Future<WeatherModel> getAll() async {
    Response res = await Dio().get(
        "https://www.meteosource.com/api/v1/free/point?place_id=tashkent&sections=all&timezone=UTC&language=en&units=metric&key=YOUR-API-KEY");

    return WeatherModel.fromJson(jsonDecode(res.data));
  }
}