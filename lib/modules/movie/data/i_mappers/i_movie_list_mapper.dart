import '../models/movie_list_model.dart';
import 'i_movie_mapper.dart';

abstract class IMovieListMapper extends IMovieMapper {
  MovieListModel movieListFromData(dynamic data);
}
