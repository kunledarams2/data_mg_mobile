


import 'package:get_storage/get_storage.dart';

class CacheManagerImpl implements CacheManager {
  final _box = GetStorage();
  final _boxRemember= GetStorage();

  @override
  Future<void> saveString(CacheKeys key, String value) async {
    return _box.write(key.toString(), value);
  }

  @override
  String getString(CacheKeys key) {
    return _box.read(key.toString()) ?? '';
  }

  @override
  Future<void> updateToken(CacheKeys key, String value) async {
    _box.remove(key.toString());
    return _box.write(key.toString(), value);
  }

  @override
  Future<bool> clearCache() async {
    _box.erase();
    return true;
  }

  Future<void> removeCacheKey(CacheKeys key){
    return  _box.remove(key.toString());
  }

  @override
  Future<void>saveRememberKeys(CacheKeys key, String value) async{
    return _boxRemember.write(key.toString(), value);
  }
  @override
  Future<bool> clearRememberKeysCache() async {
    _boxRemember.erase();
    return true;
  }

  @override
  String getRememberKeysString(CacheKeys key) {
    return _boxRemember.read(key.toString()) ?? '';
  }

  @override
  Future<void>saveToggleKeys(CacheKeys key, bool value) async{
    return _boxRemember.write(key.toString(), value);
  }


}

abstract class CacheManager {
  Future<void> saveString(CacheKeys key, String value);
  String getString(CacheKeys key);
  Future<void> updateToken(CacheKeys key, String value);
  Future<void> clearCache();
  Future<void>saveRememberKeys(CacheKeys key, String value);
  Future<bool> clearRememberKeysCache();
  String getRememberKeysString(CacheKeys key);
  Future<void>saveToggleKeys(CacheKeys key, bool value);
}

enum CacheKeys { idToken, accessToken, user, profile, rememberPassword, rememberEmail , toggleValue}
