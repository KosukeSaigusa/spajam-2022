import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../pages/about_page.dart';
import '../../pages/rooms_page.dart';

/// 現在選択状態になっている下タブを管理する StateProvider。
final bottomTabStateProvider = StateProvider<BottomTab>((_) => bottomTabs[0]);

/// BottomTab の種別。
enum BottomTabEnum {
  rooms(label: 'Rooms', location: RoomsPage.location),
  about(label: 'About', location: AboutPage.location);

  const BottomTabEnum({
    required this.label,
    required this.location,
  });

  final String label;
  final String location;
}

/// MainPage の BottomNavigationBar の内容
class BottomTab {
  const BottomTab._({
    required this.index,
    required this.key,
    required this.bottomTabEnum,
  });

  final int index;
  final GlobalKey<NavigatorState> key;
  final BottomTabEnum bottomTabEnum;
}

/// BottomNavigationBarItem.icon に表示するウィジェットを提供するプロバイダ。
final bottomTabIconProvider = Provider.family<Widget, BottomTabEnum>((ref, bottomTabEnum) {
  switch (bottomTabEnum) {
    case BottomTabEnum.rooms:
      return const FaIcon(FontAwesomeIcons.list);
    case BottomTabEnum.about:
      return const FaIcon(FontAwesomeIcons.ellipsis);
  }
});

/// MainPage に表示する BottomNavigationBarItem 一覧。
final bottomTabs = <BottomTab>[
  BottomTab._(
    index: 0,
    key: GlobalKey<NavigatorState>(),
    bottomTabEnum: BottomTabEnum.rooms,
  ),
  BottomTab._(
    index: 1,
    key: GlobalKey<NavigatorState>(),
    bottomTabEnum: BottomTabEnum.about,
  ),
];

/// BottomNavigationBarItem をタップしたときの処理を提供する Provider。
///
/// 現在表示している状態のタブをタップした場合は画面をすべて pop する。
final bottomNavigationBarItemOnTapProvider = Provider<void Function(int)>(
  (ref) => (index) {
    FocusManager.instance.primaryFocus?.unfocus();
    final bottomTab = bottomTabs[index];
    final currentBottomTab = ref.watch(bottomTabStateProvider);
    if (bottomTab == currentBottomTab) {
      bottomTab.key.currentState!.popUntil((route) => route.isFirst);
      return;
    }
    ref.read(bottomTabStateProvider.notifier).update((state) => bottomTab);
  },
);
