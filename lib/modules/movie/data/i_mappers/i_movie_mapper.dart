import '../models/movie_model.dart';

abstract class IMovieMapper {
  MovieModel movieFromData(dynamic data);
}
