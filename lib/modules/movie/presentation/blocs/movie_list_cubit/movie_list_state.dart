part of 'movie_list_cubit.dart';

abstract class MovieListState extends Equatable {
  const MovieListState();

  @override
  List<Object> get props => [];
}

class MovieListInitialState extends MovieListState {}

class MovieListLoadingState extends MovieListState {}

class MovieListLoadedState extends MovieListState {
  final MovieListEntity entity;

  const MovieListLoadedState(this.entity);
}

class MovieListFailureState extends MovieListState {
  final IFailure failure;

  const MovieListFailureState(this.failure);
}
