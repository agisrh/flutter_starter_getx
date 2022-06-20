import 'package:intl/intl.dart';

String getDateAgo({required int day}) {
  var date = DateTime.now();
  var prevDate = DateTime(date.year, date.month, date.day - day);
  String formattedDate = DateFormat('yyyy-MM-dd').format(prevDate);
  return formattedDate;
}

String getDateNow() {
  var date = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(date);
  return formattedDate;
}

String dateFormatShort(String date) {
  var formatDate = DateFormat("yyyy-MM-dd").parse(date);
  String formattedDate = DateFormat('dd MMM yyyy').format(formatDate);
  return formattedDate;
}

String greeting() {
  var message = '';
  DateTime date = DateTime.now();
  var timeNow = int.parse(DateFormat('kk').format(date));
  if (timeNow <= 12) {
    message = 'Selamat Pagi';
  } else if ((timeNow > 12) && (timeNow <= 16)) {
    message = 'Selamat Siang';
  } else if ((timeNow > 16) && (timeNow <= 20)) {
    message = 'Selamat Sore';
  } else {
    message = 'Selamat Malam';
  }
  return message;
}
