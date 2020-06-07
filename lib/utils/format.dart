import 'package:intl/intl.dart';

class Formatting {
  static final DateFormat dateAtTime = DateFormat("dd.MM.yyyy 'at' HH:mm:ss");
  static final DateFormat dateDDMMYYYY = DateFormat('dd.MM.yyyy');

  static String formatDateTime(DateTime dateTime) => dateAtTime.format(dateTime);
  static String formatDate(DateTime dateTime) => dateDDMMYYYY.format(dateTime);
}