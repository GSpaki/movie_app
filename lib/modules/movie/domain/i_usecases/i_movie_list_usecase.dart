import 'package:oxidized/oxidized.dart';

import '../../../shared/failures/i_failure.dart';
import '../entites/movie_list_entity.dart';

abstract class IMovieListUsecase<Input> {
  Future<Result<MovieListEntity, IFailure>> getMovieList(Input movieListId);
}
