import 'package:movie_app/modules/movie/data/models/movie_list_model.dart';

import 'mock_movie_model.dart';

final mockMovieListModel = MovieListModel(
  name: "The Marvel Universe",
  id: 1,
  description: "The idea behind this list is to collect the live action comic book movies from within the Marvel franchise.",
  listImageUrl: "https://image.tmdb.org/t/p/w500/coJVIUEOToAEGViuhclM7pXC75R.jpg",
  createdBy: "travisbell",
  favoriteCount: 0,
  listSize: 59,
  moviesList: [mockMovieModel],
);
