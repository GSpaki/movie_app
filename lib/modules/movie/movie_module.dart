import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import 'data/usaceses/get_movie_list_by_id_usecase.dart';
import 'external/the_movie_db/datasource/tmdb_movie_list_datasource.dart';
import 'external/the_movie_db/mappers/tmdb_movie_list_mapper.dart';
import 'external/the_movie_db/mappers/tmdb_movie_mapper.dart';
import 'infra/i_storages/i_lists_liked_local_storage.dart';
import 'infra/repositories/movie_list_repository.dart';
import 'local/hive_local_storage/storage/hive_liked_list_local_storage.dart';
import 'local/hive_local_storage/storage/hive_watched_movie_local_storage.dart';
import 'presentation/blocs/movie_list_cubit/movie_list_cubit.dart';
import 'presentation/components/watched_count/watched_count_cubit/watched_count_cubit.dart';
import 'ui/movie_list_page.dart';
import 'ui/movie_page.dart';

class MovieModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => GetMovieListByIdUsecase(i())),
        Bind.lazySingleton(
          (i) => MovieListRepository(
              datasource: i(),
              mapper: i(),
              listsLikedStorage: i<IListsLikedLocalStorage>(),
              moviesWatchedStorage: i<HiveMoviesWatchedLocalStorage>()),
        ),
        Bind.lazySingleton((i) => TmdbMovieListMapper()),
        Bind.lazySingleton((i) => TmdbMovieMapper()),
        Bind.lazySingleton((i) => TmdbMovieListDatasource(i())),
        Bind.lazySingleton((i) => Dio()),
        Bind.singleton((i) => HiveLikedListsLocalStorage()),
        Bind.singleton((i) => HiveMoviesWatchedLocalStorage()),
        BlocBind.lazySingleton((i) => MovieListCubit(i())),
        BlocBind.lazySingleton((i) => WatchedCountCubit()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => MovieListPage()),
        ChildRoute('/movie', child: (context, args) => MoviePage(args.data)),
      ];
}
