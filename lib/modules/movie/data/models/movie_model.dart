import '../../domain/entites/movie_entity.dart';
import '../i_mappers/i_movie_mapper.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.id,
    required super.title,
    required super.genresList,
    required super.mediaType,
    required super.description,
    required super.releaseDate,
    required super.backdropImageUrl,
    required super.posterImageUrl,
    required super.popularity,
    required super.voteAvarage,
    required super.voteCount,
    required super.isAdult,
  });

  factory MovieModel.fromData(IMovieMapper mapper, dynamic data) {
    return mapper.movieFromData(data);
  }
}
