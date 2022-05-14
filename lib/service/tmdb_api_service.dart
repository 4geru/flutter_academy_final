import 'package:dio/dio.dart';
import 'package:flutter_study_day7/model/aggregate_credit_object.dart';
import 'package:flutter_study_day7/model/tv_detail_result_object.dart';
import 'package:flutter_study_day7/model/tv_list_result_object.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_study_day7/model/tv_watch_prodvider_result_object.dart';

class TmdbApiService {
  static final String? _apiKey = dotenv.env['TmdbApiKey'];
  static String AnimeGenre = '16';
  final String _base_url = 'https://api.themoviedb.org/3';
  final Dio _dio = Dio();

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

  Future<List<TvListResultObject>> getDiscoverTv(int year) async {
    try {
      Response response = await _dio.get('$_base_url/discover/tv?&with_genres=$AnimeGenre&air_date.gte=$year-01-01&air_date.lte=$year-12-31&with_original_language=ja&language=ja&api_key=$_apiKey');
      List<TvListResultObject> list = List<TvListResultObject>.from(response.data['results'].map((e) => TvListResultObject.fromJson(e)));
      return list;
    } on DioError catch (e) {
      return [];
    }
  }

  Future<TvDetailResultObject?> getTv(int tvId) async {
    try {
      Response response = await _dio.get('$_base_url/tv/$tvId?api_key=$_apiKey&language=ja');
      return TvDetailResultObject.fromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  Future<TvWatchProviderResultObject?> getTvProvider(int tvId) async {
    try {
      Response response = await _dio.get('$_base_url/tv/$tvId/watch/providers?api_key=$_apiKey&language=ja');
      return TvWatchProviderResultObject.fromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  Future<List<TvListResultObject>?> getTvRecommendations(int tvId) async {
    try {
      Response response = await _dio.get('$_base_url/tv/$tvId/recommendations?api_key=$_apiKey&language=ja');
      List<TvListResultObject> list = response.data['results'].map((e) {
        return TvListResultObject.fromJson(e);
      }).toList();

      return list;
    } on DioError catch (e) {
      return null;
    }
  }

  Future<AggregateCreditObject?> getAggregateCredits(int tvId) async {
    try {
      Response response = await _dio.get('$_base_url/tv/$tvId/aggregate_credits?api_key=$_apiKey&language=ja');
      return AggregateCreditObject.fromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }
}
