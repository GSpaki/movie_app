import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/modules/movie/data/i_mappers/i_movie_list_mapper.dart';
import 'package:movie_app/modules/movie/data/models/movie_list_model.dart';
import 'package:movie_app/modules/movie/external/the_movie_db/mappers/tmdb_movie_list_mapper.dart';

import '../../../mocks/mock_movie_list_response.dart';

void main() {
  late IMovieListMapper mapper;

  setUp(() {
    mapper = TmdbMovieListMapper();
  });

  test(
    "Mapper should return a movie list model from data",
    () {
      //arrange
      final data = mockMovieListResponse;

      //act
      final actual = mapper.movieListFromData(data);

      //assert
      expect(actual, isA<MovieListModel>());
    },
  );
}
