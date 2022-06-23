import '../../../data/i_mappers/i_movie_mapper.dart';
import '../../../data/models/movie_model.dart';
import '../utils/genre_map.dart';

class TmdbMovieMapper implements IMovieMapper {
  @override
  MovieModel movieFromData(data) {
    final List dateAsIntList = data['release_date'].split('-').map((e) => int.parse(e)).toList();

    return MovieModel(
      releaseDate: DateTime(dateAsIntList[0], dateAsIntList[1], dateAsIntList[2]),
      id: data['id'],
      title: data['title'],
      genresList: [...data['genre_ids'].map((e) => genreMap[e])],
      mediaType: data['media_type'],
      description: data['overview'],
      backdropImageUrl: "https://image.tmdb.org/t/p/w500${data['backdrop_path']}",
      posterImageUrl: "https://image.tmdb.org/t/p/w500${data['poster_path']}",
      popularity: data['popularity'],
      voteAvarage: data['vote_average'].toDouble(),
      voteCount: data['vote_count'],
      isAdult: data['adult'],
    );
  }
}
