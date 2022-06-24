import 'package:oxidized/src/result.dart';

import '../../../shared/failures/i_failure.dart';
import '../../domain/entites/movie_list_entity.dart';
import '../../domain/i_usecases/i_movie_list_usecase.dart';
import '../i_repositories/i_movie_list_repository.dart';

class GetMovieListByIdUsecase implements IMovieListUsecase<int> {
  final IMovieListRepository _repository;

  GetMovieListByIdUsecase(this._repository);

  @override
  Future<Result<MovieListEntity, IFailure>> getMovieList(int movieId) async {
    try {
      final result = await _repository.getMovieList(movieId);
      return Result.ok(result);
    } on IFailure catch (failure) {
      return Result.err(failure);
    }
  }
}
