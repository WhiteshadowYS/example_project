import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum StorageKeys {
  user,
}

Map<StorageKeys, String> storageKeyValues =  {
  StorageKeys.user       : '',
};

/// A Wrapper service for FlutterSecureStorage to persist data on the device.
class LocalStorageService {
  final _service = new FlutterSecureStorage();

  LocalStorageService._privateConstructor();

  static final LocalStorageService _instance = LocalStorageService._privateConstructor();

  static LocalStorageService get instance {
    return _instance;
  }

  Future<bool> getValueExistsByKey(StorageKeys key) async {
    return await _service.read(key: storageKeyValues[key]) != null;
  }

  Future<String> getValueByKey(StorageKeys key) async {
    String value = await _service.read(key: storageKeyValues[key]);

    return value != null ? value : '';
  }

  Future<void> deleteValueByKey(StorageKeys key) async {
    await _service.delete(key: storageKeyValues[key]);
  }

  Future<void> deleteAllValues() async {
    await _service.deleteAll();
  }

  Future<void> saveValueByKey(StorageKeys key, String value) async {
    await _service.write(key: storageKeyValues[key], value: value);
  }
}
