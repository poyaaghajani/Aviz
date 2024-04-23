import 'package:intl/intl.dart';

extension NumberFormatting on num {
  // 600000 -> 6,000,000 تومان
  String priceFormatter() {
    final absoluteValue = abs(); // Get the absolute value

    final formatter = NumberFormat('#,###');
    final formattedString = formatter.format(absoluteValue);

    return '$formattedString تومان';
  }

  // 6000000 -> 6,000,000
  String priceFormatter2() {
    final absoluteValue = abs(); // Get the absolute value

    final formatter = NumberFormat('#,###');
    final formattedString = formatter.format(absoluteValue);

    return formattedString;
  }
}
