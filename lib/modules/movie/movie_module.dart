import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/usaceses/get_movie_list_by_id_usecase.dart';
import 'external/the_movie_db/datasource/tmdb_movie_list_datasource.dart';
import 'external/the_movie_db/mappers/tmdb_movie_list_mapper.dart';
import 'external/the_movie_db/mappers/tmdb_movie_mapper.dart';
import 'infra/repositories/movie_list_repository.dart';

class MovieModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => GetMovieListByIdUsecase(i())),
        Bind.lazySingleton((i) => MovieListRepository(datasource: i(), mapper: i())),
        Bind.lazySingleton((i) => TmdbMovieListMapper()),
        Bind.lazySingleton((i) => TmdbMovieMapper()),
        Bind.lazySingleton((i) => TmdbMovieListDatasource(i())),
        Bind.lazySingleton((i) => Dio()),
      ];

  @override
  List<ModularRoute> get routes => [];
}