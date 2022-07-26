import 'package:intl/intl.dart';

final _threeDigitsFormatter = NumberFormat('#,###');

extension IntExtension on int {
  /// 3 桁区切りのコンマを付加する。
  String get withComma => _threeDigitsFormatter.format(this);

  /// 数字に 3 桁区切りのコンマを付加、末尾に「円」を付けた文字列を返す。
  String get toJpy => '${_threeDigitsFormatter.format(this)} 円';

  /// 正の数ならそのまま、それ以外なら 0 を返す。
  int get replaceNegativeWithZero => this >= 0 ? this : 0;
}
