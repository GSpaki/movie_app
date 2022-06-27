import 'package:flutter/material.dart';

import '../presentation/controllers/movie_list_controller.dart';
import '../presentation/presenters/movie_list_presenter.dart';

class MovieListPage extends StatelessWidget {
  MovieListPage({Key? key}) : super(key: key);
  final MovieListController listController = MovieListController();

  @override
  Widget build(BuildContext context) {
    listController.loadMovieList();
    return const Scaffold(
      body: MovieListPresenter(),
    );
  }
}
