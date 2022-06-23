import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/modules/movie/data/i_mappers/i_movie_mapper.dart';
import 'package:movie_app/modules/movie/data/models/movie_model.dart';
import 'package:movie_app/modules/movie/external/the_movie_db/mappers/tmdb_movie_mapper.dart';

import '../../../mocks/mock_movie_response.dart';

void main() {
  late IMovieMapper mapper;

  setUp(() {
    mapper = TmdbMovieMapper();
  });

  test(
    "Mapper should return a movie model from data",
    () {
      //arrange
      final data = mockMovieResponse;

      //act
      final actual = mapper.movieFromData(data);

      //assert
      expect(actual, isA<MovieModel>());
    },
  );
}
