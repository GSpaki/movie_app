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
    super.isWatched = false,
  });

  factory MovieModel.fromData(IMovieMapper mapper, dynamic data) {
    return mapper.movieFromData(data);
  }

  factory MovieModel.fromEntity(MovieEntity movieEntity) {
    return MovieModel(
      id: movieEntity.id,
      title: movieEntity.title,
      genresList: movieEntity.genresList,
      mediaType: movieEntity.mediaType,
      description: movieEntity.description,
      releaseDate: movieEntity.releaseDate,
      backdropImageUrl: movieEntity.backdropImageUrl,
      posterImageUrl: movieEntity.posterImageUrl,
      popularity: movieEntity.popularity,
      voteAvarage: movieEntity.voteAvarage,
      voteCount: movieEntity.voteCount,
      isAdult: movieEntity.isAdult,
    );
  }

  MovieModel copyWith({
    int? id,
    String? title,
    List<String>? genresList,
    String? mediaType,
    String? description,
    DateTime? releaseDate,
    String? backdropImageUrl,
    String? posterImageUrl,
    double? popularity,
    double? voteAvarage,
    int? voteCount,
    bool? isAdult,
    bool? isWatched,
  }) {
    return MovieModel(
      id: id ?? this.id,
      title: title ?? this.title,
      genresList: genresList ?? this.genresList,
      mediaType: mediaType ?? this.mediaType,
      description: description ?? this.description,
      releaseDate: releaseDate ?? this.releaseDate,
      backdropImageUrl: backdropImageUrl ?? this.backdropImageUrl,
      posterImageUrl: posterImageUrl ?? this.posterImageUrl,
      popularity: popularity ?? this.popularity,
      voteAvarage: voteAvarage ?? this.voteAvarage,
      voteCount: voteCount ?? this.voteCount,
      isAdult: isAdult ?? this.isAdult,
      isWatched: isWatched ?? this.isWatched,
    );
  }
}
