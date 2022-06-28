import '../../../infra/i_storages/i_movies_watched_local_storage.dart';
import 'hive_local_storage.dart';

class HiveMoviesWatchedLocalStorage extends HiveLocalStorage implements IMoviesWatchedLocalStorage {
  HiveMoviesWatchedLocalStorage() : super('moviesWatched');
}
