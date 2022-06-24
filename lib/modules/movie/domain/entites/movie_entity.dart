import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final List<String> genresList;
  final String mediaType;
  final String description;
  final DateTime releaseDate;
  final String backdropImageUrl;
  final String posterImageUrl;
  final double popularity;
  final double voteAvarage;
  final int voteCount;
  final bool isAdult;
  final bool isWatched;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.genresList,
    required this.mediaType,
    required this.description,
    required this.releaseDate,
    required this.backdropImageUrl,
    required this.posterImageUrl,
    required this.popularity,
    required this.voteAvarage,
    required this.voteCount,
    required this.isAdult,
    this.isWatched = false,
  });

  @override
  List<Object?> get props => [id, title];
}
