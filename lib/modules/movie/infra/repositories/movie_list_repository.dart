import '../../../shared/failures/datasource_failure.dart';
import '../../../shared/failures/mapper_failure.dart';
import '../../data/i_mappers/i_movie_list_mapper.dart';
import '../../data/i_repositories/i_movie_list_repository.dart';
import '../../data/models/movie_list_model.dart';
import '../i_datasources/i_movie_list_datasource.dart';

class MovieListRepository implements IMovieListRepository {
  final IMovieListDatasource _datasource;
  final IMovieListMapper _mapper;

  MovieListRepository({required IMovieListDatasource datasource, required IMovieListMapper mapper})
      : _datasource = datasource,
        _mapper = mapper;

  @override
  Future<MovieListModel> getMovieList(int movieId) async {
    final dynamic data;

    try {
      data = await _datasource.getMovieList(movieId);
    } on DatasourceFailure {
      rethrow;
    }

    final MovieListModel model;

    try {
      model = _mapper.movieListFromData(data);
    } catch (e) {
      throw MapperFailure();
    }

    return model;
  }
}
