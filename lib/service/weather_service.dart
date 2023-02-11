import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ob_havo_app/models/weather_api_model.dart';


class PokemonService {
  static Future<WeatherModel> getAll() async {
    Response res = await Dio().get(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");

    return WeatherModel.fromJson(jsonDecode(res.data));
  }
}