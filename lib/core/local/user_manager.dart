/*
import 'dart:convert';

import 'package:get/utils.dart';



import 'cache_manager.dart';

class UserManagerImpl implements UserManager {
  final CacheManager cacheManager;

  const UserManagerImpl({required this.cacheManager});

  @override
  Future<void> updateUser(User user) async {
    final String userString = jsonEncode(user);
    await cacheManager.saveString(CacheKeys.user, userString);
  }

  @override
  User getUser() {
    final String userString = cacheManager.getString(CacheKeys.user);
    if (userString.isEmpty) {
      return User();
    }

    return User.fromJson(jsonDecode(userString));
  }


}

abstract class UserManager {
  Future<void> updateUser(User user);
  User getUser();

  */
/*Future<void> saveProfileDetails(ProfileResponse profile);
  ProfileResponse? getProfileDetails();*//*

}
*/
