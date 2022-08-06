import 'package:flutter/material.dart';

import '../../pages/about_page.dart';
import '../../pages/main_page.dart';
import '../../pages/not_found_page.dart';
import '../../pages/sign_in_page.dart';
import 'app_route.dart';

/// AppRoute インスタンスの一覧
/// 各ページのコンストラクタに引数を渡さない済むように、そのような場合は ProviderScope.override で
/// appRouterStateProvider の値をオーバーライドして、各画面を AppState をオーバーライドされた
/// Provider 経由で取得するようにする。
final appRoutes = <AppRoute>[
  AppRoute(
    path: MainPage.path,
    name: MainPage.name,
    builder: (context, state) => const MainPage(key: ValueKey(MainPage.name)),
  ),
  AppRoute(
    path: AboutPage.path,
    name: AboutPage.name,
    builder: (context, state) => const AboutPage(key: ValueKey(AboutPage.name)),
  ),
  AppRoute(
    path: NotFoundPage.path,
    name: NotFoundPage.name,
    builder: (context, state) =>
        const NotFoundPage(key: ValueKey(NotFoundPage.name)),
  ),
  AppRoute(
    path: SignInPage.path,
    name: SignInPage.name,
    builder: (context, state) =>
        const SignInPage(key: ValueKey(SignInPage.name)),
  ),
];