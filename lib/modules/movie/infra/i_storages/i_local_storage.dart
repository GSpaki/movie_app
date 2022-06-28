abstract class ILocalStorage {
  Future<bool?> get(int key);

  Future put(int key, bool value);

  Future delete(int key);
}
