import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../features/auth/auth.dart';
import '../repositories/app_user_repository.dart';
import '../utils/hooks/package_info_state.dart';
import '../utils/logger.dart';

class AboutPage extends HookConsumerWidget {
  const AboutPage({super.key});

  static const path = '/about';
  static const name = 'AboutPage';
  static const location = path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfoState = usePackageInfoState();
    final packageInfo = packageInfoState.packageInfo;
    return Scaffold(
      appBar: AppBar(title: const Text('このアプリについて')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('App Name: ${_getAppNameText(packageInfo)}'),
            Text('Version: ${_getVersionInfoText(packageInfo)}'),
            ElevatedButton(
              onPressed: () => ref.read(signOutProvider)(),
              child: const Text('サインアウト'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            final appUser = await ref
                .read(appUserRepositoryProvider)
                .fetchAppUser(appUserId: 'test');
            logger.info(appUser.toString());
          } on FirebaseException catch (e) {
            logger.warning(e.toString());
          }
        },
      ),
    );
  }

  /// バージョン番号のテキストを取得する
  String _getAppNameText(PackageInfo? packageInfo) {
    if (packageInfo == null) {
      return '';
    }
    return packageInfo.appName;
  }

  /// バージョン番号のテキストを取得する
  String _getVersionInfoText(PackageInfo? packageInfo) {
    if (packageInfo == null) {
      return '';
    }
    return '${packageInfo.version}+${packageInfo.buildNumber}';
  }
}
