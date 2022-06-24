import 'package:dio/dio.dart';

import '../../../../../env/env.dart';
import '../../../../shared/failures/datasource_failure.dart';
import '../../../infra/i_datasources/i_movie_list_datasource.dart';

class TmdbMovieListDatasource implements IMovieListDatasource {
  final Dio _client;

  TmdbMovieListDatasource(this._client);

  @override
  Future getMovieList(int movieId) async {
    try {
      Response response = await _client.get('https://api.themoviedb.org/3/list/$movieId?api_key=$tmdbApiKey');
      return response.data;
    } on DioError {
      throw DatasourceFailure();
    }
  }
}
