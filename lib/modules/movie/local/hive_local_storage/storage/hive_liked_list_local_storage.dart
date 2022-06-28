import '../../../infra/i_storages/i_lists_liked_local_storage.dart';
import 'hive_local_storage.dart';

class HiveLikedListsLocalStorage extends HiveLocalStorage implements IListsLikedLocalStorage {
  HiveLikedListsLocalStorage() : super('movieListsLiked');
}
