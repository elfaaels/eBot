import 'package:intl/intl.dart';

class DateFormatUtils {
  static String parseDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return dateTime.toLocal().toString();
  }

  static String formatDate(String date) {
    DateTime parsedDate = DateTime.parse(date);
    DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    String formattedDate = formatter.format(parsedDate);
    return formattedDate;
  }
}
