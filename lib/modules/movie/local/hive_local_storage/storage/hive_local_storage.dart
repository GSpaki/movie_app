import 'dart:async';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../../infra/i_storages/i_local_storage.dart';

class HiveLocalStorage implements ILocalStorage {
  final String _boxName;
  final Completer<Box> _box = Completer<Box>();

  HiveLocalStorage(this._boxName) {
    _init();
  }

  _init() async {
    if (!kIsWeb) {
      final appDirectory = await getApplicationDocumentsDirectory();
      Hive.init(appDirectory.path);
    }

    var box = await Hive.openBox(_boxName);
    _box.complete(box);
  }

  @override
  delete(int key) async {
    var box = await _box.future;
    box.delete(key);
  }

  @override
  Future<bool?> get(int key) async {
    var box = await _box.future;

    return box.get(key);
  }

  @override
  put(int key, bool value) async {
    var box = await _box.future;

    return box.put(key, value);
  }
}
