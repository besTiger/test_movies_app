import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/movie_model.dart';

class MoviesViewModel extends GetxController {
  getPopular() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=e8bf0a88d8c448b3069dca27bd1d7619e6ef194a3a6&language=en-US&page=1');

    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        return Movies.fromjson(jsonDecode(response.body));
      } catch (e) {
        Get.snackbar('Can Not Load Data', e.toString());
      }
    }
  }

  getTopRated() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=e8bf0a88d8c448b3069dca27bd1d7619&language=en-US&page=1');

    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        return Movies.fromjson(jsonDecode(response.body));
      } catch (e) {
        Get.snackbar('Can Not Load Data', e.toString());
      }
    }
  }

  getUpcoming() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=e8bf0a88d8c448b3069dca27bd1d7619&language=en-US&page=1');

    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        return Movies.fromjson(jsonDecode(response.body));
      } catch (e) {
        Get.snackbar('Can Not Load Data', e.toString());
      }
    }
  }
}