import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/modules/movie/infra/i_storages/i_local_storage.dart';
import 'package:movie_app/modules/movie/local/hive_local_storage/storage/hive_local_storage.dart';

void main() {
  late ILocalStorage storage;
  setUp(() {
    storage = HiveLocalStorage('test');
  });
  test(
    "Storage should return a boolen when called successefully",
    () async {
      //arrange
      storage.put(1, true);

      //act
      final actual = await storage.get(1);

      //assert
      expect(actual, isA<bool>());
    },
  );

  test(
    "Storage should return null when there isn't matching key",
    () async {
      //arrange
      storage.put(1, true);

      //act
      final actual = await storage.get(2);

      //assert
      expect(actual, null);
    },
  );

  test(
    "Storage should return a bool then null when delete methode called successefully",
    () async {
      //arrange
      storage.put(1, true);

      //act
      var actual = await storage.get(1);

      //assert
      expect(actual, isA<bool>());

      //act
      storage.delete(1);
      actual = await storage.get(1);

      //assert
      expect(actual, null);
    },
  );
}
