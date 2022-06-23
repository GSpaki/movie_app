import '../../../data/i_mappers/i_movie_list_mapper.dart';
import '../../../data/models/movie_list_model.dart';
import 'tmdb_movie_mapper.dart';

class TmdbMovieListMapper extends TmdbMovieMapper implements IMovieListMapper {
  @override
  MovieListModel movieListFromData(data) {
    return MovieListModel(
      name: data['name'],
      id: int.parse(data['id']),
      description: data['description'],
      listImageUrl: "https://image.tmdb.org/t/p/w500${data['poster_path']}",
      createdBy: data['created_by'],
      favoriteCount: data['favorite_count'],
      listSize: data['item_count'],
      moviesList: [...data['items'].map((movieData) => movieFromData(movieData))],
    );
  }
}
