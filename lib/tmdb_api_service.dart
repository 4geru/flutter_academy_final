import 'package:dio/dio.dart';
import 'package:flutter_study_day7/model/tv_list_result_object.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TmdbApiService {
  static String? _apiKey = dotenv.env['TmdbApiKey'];
  String _base_url = 'https://api.themoviedb.org/3';
  Dio _dio = Dio();

  Future<List<TvListResultObject>?> getPopularTvShows() async {
    print('called');
    try {
      Response response = await _dio.get(_base_url + '/tv/popular?api_key=$_apiKey');
      print(response.data['results']);

      List<TvListResultObject> list = response.data['results'].map((e) {
        print(e);
        return TvListResultObject.fromJson(e);
      }).toList();

      return list;
    } on DioError catch (e) {
      print(e);
    }
  }
}