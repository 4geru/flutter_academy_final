import 'package:dio/dio.dart';
import 'package:flutter_study_day7/model/tv_list_result_object.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TmdbApiService {
  static String? _apiKey = dotenv.env['TmdbApiKey'];
  static String AnimeGenre = '16';
  String _base_url = 'https://api.themoviedb.org/3';
  Dio _dio = Dio();

  Future<List<TvListResultObject>> getPopularTvShows() async {
    try {
      Response response = await _dio.get('$_base_url/tv/popular?api_key=$_apiKey');
      List<TvListResultObject> list = response.data['results'].map((e) {
        return TvListResultObject.fromJson(e);
      }).toList();

      return list;
    } on DioError catch (e) {
      return [];
    }
  }

  Future<List<TvListResultObject>> getDiscoverTv(year) async {
    try {
      Response response = await _dio.get('$_base_url/discover/tv?&with_genres=$AnimeGenre&air_date.gte=$year-01-01&air_date.lte=$year-12-31&with_original_language=ja&api_key=$_apiKey');
      List<TvListResultObject> list = new List<TvListResultObject>.from(response.data['results'].map((e) => TvListResultObject.fromJson(e)));

      return list;
    } on DioError catch (e) {
      return [];
    }
  }
}
