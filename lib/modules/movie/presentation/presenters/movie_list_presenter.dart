import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/failures/datasource_failure.dart';
import '../../../shared/failures/i_failure.dart';
import '../../../shared/failures/mapper_failure.dart';
import '../blocs/movie_list_cubit/movie_list_cubit.dart';
import '../components/movie_list_header/movie_list_header.dart';
import '../components/movie_tile/movie_tile.dart';

class MovieListPresenter extends StatelessWidget {
  const MovieListPresenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieListState state = context.watch<MovieListCubit>().state;

    if (state is MovieListLoadingState) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.grey,
        ),
      );
    } else if (state is MovieListLoadedState) {
      return ListView(
        shrinkWrap: true,
        children: [
          MovieListHeader(
            listName: state.entity.name,
            imageUrl: state.entity.listImageUrl,
            isLiked: state.entity.isLiked,
            likeCount: state.entity.favoriteCount,
            numberOfMovies: state.entity.listSize,
            numberOfWatchedMovies: state.entity.watchedTotal,
          ),
          ...state.entity.moviesList.map((movie) => MovieTile(movie)),
        ],
      );
    } else if (state is MovieListFailureState) {
      return FailureWidget(state.failure);
    } else {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.red,
        ),
      );
    }
  }
}

class FailureWidget extends StatelessWidget {
  const FailureWidget(this.failure, {super.key});

  final IFailure failure;

  @override
  Widget build(BuildContext context) {
    if (failure is MapperFailure) {
      return Center(
        child: Column(
          children: const [
            Text('Local error while converting data.'),
            Text('Please, contact our support.'),
          ],
        ),
      );
    } else if (failure is DatasourceFailure) {
      return Center(
        child: Column(
          children: const [
            Text('Datasource error. Try again soon'),
            Text('If error persist, please, contact our support.'),
          ],
        ),
      );
    } else {
      return Center(
        child: Column(
          children: const [
            Text('Some error happened'),
            Text('If error persist, please, contact our support.'),
          ],
        ),
      );
    }
  }
}
