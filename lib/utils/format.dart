import 'package:age/age.dart';
import 'package:intl/intl.dart';

//TODO change to extension
class Formatting {
  static final DateFormat dateAtTime = DateFormat("dd.MM.yyyy 'at' HH:mm:ss");
  static final DateFormat dateDDMMYYYY = DateFormat('dd.MM.yyyy');

  static String formatDateTime(DateTime dateTime) => dateAtTime.format(dateTime);
  static String formatDate(DateTime dateTime) => dateDDMMYYYY.format(dateTime);
  static String getAge(DateTime dateTime) => Age.dateDifference(
    fromDate: dateTime, toDate: DateTime.now(),)?.years.toString();
}