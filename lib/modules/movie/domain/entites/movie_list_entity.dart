import 'package:equatable/equatable.dart';

import 'movie_entity.dart';

class MovieListEntity extends Equatable {
  final String name;
  final int id;
  final String description;
  final String listImageUrl;
  final String createdBy;
  final int favoriteCount;
  final int listSize;
  final List<MovieEntity> moviesList;

  const MovieListEntity({
    required this.name,
    required this.id,
    required this.description,
    required this.listImageUrl,
    required this.createdBy,
    required this.favoriteCount,
    required this.listSize,
    required this.moviesList,
  });

  @override
  List<Object?> get props => [name, id];
}
