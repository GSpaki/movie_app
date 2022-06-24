import '../models/movie_list_model.dart';

abstract class IMovieListRepository {
  Future<MovieListModel> getMovieList(int movieId);
}
