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
  final bool isLiked;
  final List<MovieEntity> moviesList;

  int get watchedTotal {
    return moviesList.where((movie) => (movie.isWatched == true)).length;
  }

  const MovieListEntity({
    required this.name,
    required this.id,
    required this.description,
    required this.listImageUrl,
    required this.createdBy,
    required this.favoriteCount,
    required this.listSize,
    required this.moviesList,
    this.isLiked = false,
  });

  @override
  List<Object?> get props => [name, id];
}
