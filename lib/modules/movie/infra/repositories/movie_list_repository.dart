import '../../../shared/failures/datasource_failure.dart';
import '../../../shared/failures/mapper_failure.dart';
import '../../data/i_mappers/i_movie_list_mapper.dart';
import '../../data/i_repositories/i_movie_list_repository.dart';
import '../../data/models/movie_list_model.dart';
import '../../data/models/movie_model.dart';
import '../i_datasources/i_movie_list_datasource.dart';
import '../i_storages/i_lists_liked_local_storage.dart';
import '../i_storages/i_movies_watched_local_storage.dart';

class MovieListRepository implements IMovieListRepository {
  final IMovieListDatasource _datasource;
  final IMovieListMapper _mapper;
  final IListsLikedLocalStorage _listsLikedStorage;
  final IMoviesWatchedLocalStorage _moviesWatchedStorage;

  MovieListRepository(
      {required IMovieListDatasource datasource,
      required IMovieListMapper mapper,
      required listsLikedStorage,
      required moviesWatchedStorage})
      : _datasource = datasource,
        _mapper = mapper,
        _listsLikedStorage = listsLikedStorage,
        _moviesWatchedStorage = moviesWatchedStorage;

  @override
  Future<MovieListModel> getMovieList(int movieId) async {
    final dynamic data;

    try {
      data = await _datasource.getMovieList(movieId);
    } on DatasourceFailure {
      rethrow;
    }

    MovieListModel model;

    try {
      model = _mapper.movieListFromData(data);
    } catch (e) {
      throw MapperFailure();
    }

    final bool? isLiked = await _listsLikedStorage.get(model.id);

    if (isLiked != null && isLiked != false) {
      model = model.copyWith(isLiked: isLiked);
    }

    final listWithLocalData = model.moviesList.map((movie) async {
      final bool? isWatched = await _moviesWatchedStorage.get(movie.id);
      if (isWatched != null && isWatched != false) {
        return MovieModel.fromEntity(movie).copyWith(isWatched: isWatched);
      }
      return MovieModel.fromEntity(movie);
    });

    final newModel = model.copyWith(moviesList: await Future.wait(listWithLocalData));

    return newModel;
  }
}
