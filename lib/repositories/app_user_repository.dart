import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/app_user.dart';
import '../utils/firestore_refs.dart';
import '../utils/logger.dart';

final appUserRepositoryProvider =
    Provider.autoDispose((_) => AppUserRepository());

class AppUserRepository {
  /// 指定した AppUser を取得する。
  Future<AppUser?> fetchAppUser({
    required String appUserId,
  }) async {
    final ds = await appUserRef(appUserId: appUserId).get();
    if (!ds.exists) {
      logger.warning('Document not found: ${ds.reference.path}');
      return null;
    }
    return ds.data()!;
  }

  /// 指定した userId のユーザーを `SetOptions(merge: true)` で作成する。
  Future<void> setUser({required String userId}) async {
    await appUserRef(appUserId: userId)
        .set(AppUser(appUserId: userId, name: userId), SetOptions(merge: true));
  }
}
