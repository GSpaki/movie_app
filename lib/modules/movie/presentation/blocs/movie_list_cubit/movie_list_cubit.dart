import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../shared/failures/i_failure.dart';
import '../../../data/usaceses/get_movie_list_by_id_usecase.dart';
import '../../../domain/entites/movie_list_entity.dart';

part 'movie_list_state.dart';

class MovieListCubit extends Cubit<MovieListState> {
  MovieListCubit(this._usecase) : super(MovieListInitialState());

  final GetMovieListByIdUsecase _usecase;

  Future<void> getMovieListById(int id) async {
    final result = _usecase.getMovieList(id);
    emit(MovieListLoadingState());

    (await result).when(
      ok: (entity) => emit(MovieListLoadedState(entity)),
      err: (failure) => emit(MovieListFailureState(failure)),
    );
  }
}
