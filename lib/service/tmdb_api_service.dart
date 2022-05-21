import 'package:dio/dio.dart';
import '../model/aggregate_credit_object.dart';
import '../model/tv_detail_result_object.dart';
import '../model/tv_list_result_object.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../model/tv_watch_prodvider_result_object.dart';

class TmdbApiService {
  static final String? _apiKey = dotenv.env['TmdbApiKey'];
  static const String _animeGenre = '16';
  final String _baseUrl = 'https://api.themoviedb.org/3';
  final Dio _dio = Dio();

  Future<List<TvListResultObject>> getPopularTvShows() async {
    try {
      final response = await _dio.get('$_baseUrl/tv/popular?api_key=$_apiKey');
      final List<TvListResultObject> list = response.data['results'].map((e) {
        return TvListResultObject.fromJson(e);
      }).toList();

      return list;
    } on DioError catch (_) {
      return [];
    }
  }

  Future<List<TvListResultObject>> getDiscoverTv(int year, {int page = 1}) async {
    try {
      final response = await _dio.get('$_baseUrl/discover/tv?&with_genres=$_animeGenre&air_date.gte=$year-01-01&air_date.lte=$year-12-31&with_original_language=ja&language=ja&api_key=$_apiKey&page=$page');
      final list = List<TvListResultObject>.from(response.data['results'].map((e) => TvListResultObject.fromJson(e)));
      return list;
    } on DioError catch (_) {
      return [];
    }
  }

  Future<TvDetailResultObject?> getTv(int tvId) async {
    try {
      final response = await _dio.get('$_baseUrl/tv/$tvId?api_key=$_apiKey&language=ja');
      return TvDetailResultObject.fromJson(response.data);
    } on DioError catch (_) {
      return null;
    }
  }

  Future<TvWatchProviderResultObject?> getTvProvider(int tvId) async {
    try {
      final response = await _dio.get('$_baseUrl/tv/$tvId/watch/providers?api_key=$_apiKey&language=ja');
      return TvWatchProviderResultObject.fromJson(response.data);
    } on DioError catch (_) {
      return null;
    }
  }

  Future<List<TvListResultObject>?> getTvRecommendations(int tvId) async {
    try {
      final response = await _dio.get('$_baseUrl/tv/$tvId/recommendations?api_key=$_apiKey&language=ja');
      final List<TvListResultObject> list = response.data['results'].map((e) {
        return TvListResultObject.fromJson(e);
      }).toList();

      return list;
    } on DioError catch (_) {
      return null;
    }
  }

  Future<AggregateCreditObject?> getAggregateCredits(int tvId) async {
    try {
      final response = await _dio.get('$_baseUrl/tv/$tvId/aggregate_credits?api_key=$_apiKey&language=ja');
      return AggregateCreditObject.fromJson(response.data);
    } on DioError catch (_) {
      return null;
    }
  }
}
