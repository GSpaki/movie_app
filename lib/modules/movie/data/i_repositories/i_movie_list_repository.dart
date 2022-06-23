import '../models/movie_list_model.dart';

abstract class IMovieRepository {
  Future<MovieListModel> getMovie(int movieId);
}
