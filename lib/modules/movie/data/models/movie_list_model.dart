import '../../domain/entites/movie_list_entity.dart';
import '../i_mappers/i_movie_list_mapper.dart';
import 'movie_model.dart';

class MovieListModel extends MovieListEntity {
  const MovieListModel({
    required super.name,
    required super.id,
    required super.description,
    required super.listImageUrl,
    required super.createdBy,
    required super.favoriteCount,
    required super.listSize,
    required super.moviesList,
    super.isLiked = false,
  });

  factory MovieListModel.fromData(IMovieListMapper mapper, dynamic data) {
    return mapper.movieListFromData(data);
  }
  MovieListModel copyWith({
    String? name,
    int? id,
    String? description,
    String? listImageUrl,
    String? createdBy,
    int? favoriteCount,
    int? listSize,
    bool? isLiked,
    List<MovieModel>? moviesList,
  }) {
    return MovieListModel(
      name: name ?? this.name,
      id: id ?? this.id,
      description: description ?? this.description,
      listImageUrl: listImageUrl ?? this.listImageUrl,
      createdBy: createdBy ?? this.createdBy,
      favoriteCount: favoriteCount ?? this.favoriteCount,
      listSize: listSize ?? this.listSize,
      isLiked: isLiked ?? this.isLiked,
      moviesList: moviesList ?? this.moviesList,
    );
  }
}
