import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/modules/movie/data/i_repositories/i_movie_list_repository.dart';
import 'package:movie_app/modules/movie/data/usaceses/get_movie_list_by_id_usecase.dart';
import 'package:movie_app/modules/movie/domain/entites/movie_list_entity.dart';
import 'package:movie_app/modules/movie/domain/i_usecases/i_movie_list_usecase.dart';
import 'package:movie_app/modules/shared/failures/i_failure.dart';
import 'package:movie_app/modules/shared/failures/repository_failure.dart';

import '../../mocks/mock_movie_list_model.dart';

class MockMovieRepository extends Mock implements IMovieListRepository {}

void main() {
  late IMovieListUsecase usecase;
  late IMovieListRepository repository;

  setUp(() {
    repository = MockMovieRepository();
    usecase = GetMovieListByIdUsecase(repository);
  });

  test(
    "Usecase should return a movie list entity when called successefully",
    () async {
      //arrange
      when(() => repository.getMovieList(any())).thenAnswer((_) async => mockMovieListModel);

      //act
      final result = await usecase.getMovieList(10);
      final actual = result.unwrap();

      //assert
      expect(actual, isA<MovieListEntity>());
    },
  );

  test(
    "Usecase should return a failure when called unsuccessefully",
    () async {
      //arrange
      when(() => repository.getMovieList(any())).thenThrow(RepositoryFailure());

      //act
      final result = await usecase.getMovieList(10);
      final actual = result.unwrapErr();

      //assert
      expect(actual, isA<IFailure>());
    },
  );
}
