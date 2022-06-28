import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/modules/movie/data/i_mappers/i_movie_list_mapper.dart';
import 'package:movie_app/modules/movie/data/i_repositories/i_movie_list_repository.dart';
import 'package:movie_app/modules/movie/data/models/movie_list_model.dart';
import 'package:movie_app/modules/movie/infra/i_datasources/i_movie_list_datasource.dart';
import 'package:movie_app/modules/movie/infra/i_storages/i_local_storage.dart';
import 'package:movie_app/modules/movie/infra/repositories/movie_list_repository.dart';
import 'package:movie_app/modules/shared/failures/datasource_failure.dart';
import 'package:movie_app/modules/shared/failures/mapper_failure.dart';

import '../../mocks/mock_movie_list_model.dart';
import '../../mocks/mock_movie_list_response.dart';

class MockMovieListDatasource extends Mock implements IMovieListDatasource {}

class MockMovieListMapper extends Mock implements IMovieListMapper {}

class MockLocalStorage extends Mock implements ILocalStorage {}

void main() {
  late IMovieListRepository repository;
  late IMovieListDatasource datasource;
  late IMovieListMapper mapper;
  late ILocalStorage likedStorage;
  late ILocalStorage watchedStorage;

  setUp(() {
    datasource = MockMovieListDatasource();
    mapper = MockMovieListMapper();
    likedStorage = MockLocalStorage();
    watchedStorage = MockLocalStorage();
    repository = MovieListRepository(
      datasource: datasource,
      mapper: mapper,
      listsLikedStorage: likedStorage,
      moviesWatchedStorage: watchedStorage,
    );
  });

  test(
    "Repository should return a movie list model when datasource called successefully and there is data at local storage",
    () async {
      //arrange
      when(() => datasource.getMovieList(any())).thenAnswer((_) async => mockMovieListResponse);
      when(() => mapper.movieListFromData(any())).thenAnswer((_) => mockMovieListModel);
      when(() => likedStorage.get(any())).thenAnswer((_) async => true);
      when(() => watchedStorage.get(any())).thenAnswer((_) async => true);

      //act
      final actual = await repository.getMovieList(1);

      //assert
      expect(actual, isA<MovieListModel>());
      expect(actual.moviesList.first.isWatched, true);
    },
  );

  test(
    "Repository should return a movie list model when datasource called successefully and there isn't data at local storage",
    () async {
      //arrange
      when(() => datasource.getMovieList(any())).thenAnswer((_) async => mockMovieListResponse);
      when(() => mapper.movieListFromData(any())).thenAnswer((_) => mockMovieListModel);
      when(() => likedStorage.get(any())).thenAnswer((_) async => null);
      when(() => watchedStorage.get(any())).thenAnswer((_) async => null);

      //act
      final actual = await repository.getMovieList(1);

      //assert
      expect(actual, isA<MovieListModel>());
    },
  );

  test(
    "Repository should throw a mapper failure when map data unsuccessefully",
    () {
      //arrange
      when(() => datasource.getMovieList(any())).thenAnswer((_) async => mockMovieListResponse);
      when(() => mapper.movieListFromData(any())).thenThrow(TypeError());

      //act
      final actual = repository.getMovieList(1);

      //assert
      expect(actual, throwsA(isA<MapperFailure>()));
    },
  );

  test(
    "Repository should throw a datasource failure when datasource called unsuccessefully",
    () {
      //arrange
      when(() => datasource.getMovieList(any())).thenThrow(DatasourceFailure());

      //act
      final actual = repository.getMovieList(1);

      //assert
      expect(actual, throwsA(isA<DatasourceFailure>()));
    },
  );
}
