import 'package:flutter_modular/flutter_modular.dart';

import '../blocs/movie_list_cubit/movie_list_cubit.dart';

class MovieListController {
  final MovieListCubit movieListCubit = Modular.get<MovieListCubit>();

  void loadMovieList() {
    movieListCubit.getMovieListById(2);
    //TODO: replace const id
  }
}
