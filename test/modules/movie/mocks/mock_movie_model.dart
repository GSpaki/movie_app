import 'package:movie_app/modules/movie/data/models/movie_model.dart';

final mockMovieModel = MovieModel(
  id: 634649,
  title: "Spider-Man: No Way Home",
  genresList: const [28, 12, 878],
  mediaType: "movie",
  description:
      "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
  releaseDate: DateTime(2021, 12, 15),
  backdropImageUrl: 'http://image.tmdb.org/t/p/w500/ocUp7DJBIc8VJgLEw1prcyK1dYv.jpg',
  posterImageUrl: 'https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg',
  popularity: 1995.667,
  voteAvarage: 8.1,
  voteCount: 13633,
  isAdult: false,
);
