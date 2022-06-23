import '../../domain/entites/movie_list_entity.dart';

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
  });
}
