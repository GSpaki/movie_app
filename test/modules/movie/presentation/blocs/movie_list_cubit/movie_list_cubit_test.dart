import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/modules/movie/data/usaceses/get_movie_list_by_id_usecase.dart';
import 'package:movie_app/modules/movie/presentation/blocs/movie_list_cubit/movie_list_cubit.dart';
import 'package:movie_app/modules/shared/failures/datasource_failure.dart';
import 'package:oxidized/oxidized.dart';

import '../../../mocks/mock_movie_list_model.dart';

class MockMovieListUsecase extends Mock implements GetMovieListByIdUsecase {}

void main() {
  late MovieListCubit cubit;
  late MockMovieListUsecase usecase;
  setUp(() {
    usecase = MockMovieListUsecase();
    cubit = MovieListCubit(usecase);
  });

  tearDown(() {
    cubit.close();
  });
  test(
    "Cubit should emit loading than loaded state when called succefully",
    () async {
      //arrange
      when(() => usecase.getMovieList(any())).thenAnswer((_) async => Result.ok(mockMovieListModel));

      //assert
      expectLater(cubit.stream, emitsInOrder([isA<MovieListLoadingState>(), isA<MovieListLoadedState>()]));

      //act
      cubit.getMovieListById(1);
    },
  );
  test(
    "Cubit should emit loading than failure state when called unsuccefully",
    () async {
      //arrange
      when(() => usecase.getMovieList(any())).thenAnswer((_) async => Result.err(DatasourceFailure()));

      //assert
      expectLater(cubit.stream, emitsInOrder([isA<MovieListLoadingState>(), isA<MovieListFailureState>()]));

      //act
      cubit.getMovieListById(1);
    },
  );
}
