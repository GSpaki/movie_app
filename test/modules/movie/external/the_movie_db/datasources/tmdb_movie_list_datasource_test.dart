import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/modules/movie/external/the_movie_db/datasource/tmdb_movie_list_datasource.dart';
import 'package:movie_app/modules/movie/infra/i_datasources/i_movie_list_datasource.dart';
import 'package:movie_app/modules/shared/failures/datasource_failure.dart';

import '../../../mocks/mock_movie_list_response.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late IMovieListDatasource datasource;
  late Dio client;

  setUp(() {
    client = MockDio();
    datasource = TmdbMovieListDatasource(client);
  });

  test(
    "Datasource should return a movie list data when called successefully",
    () async {
      //arrange
      when(() => client.get(any())).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: 'path'),
            data: mockMovieListResponse,
          ));

      //act
      final actual = await datasource.getMovieList(1);

      //assert
      expect(actual, isA<dynamic>());
    },
  );

  test(
    "Datasource should throw a datasource failure when caleed unsuccessefully",
    () async {
      //arrange
      when(() => client.get(any())).thenThrow(DioError(
        requestOptions: RequestOptions(path: 'path'),
      ));

      //act
      final actual = datasource.getMovieList(1);

      //assert
      expect(actual, throwsA(isA<DatasourceFailure>()));
    },
  );
}
