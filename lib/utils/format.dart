import 'package:intl/intl.dart';

class Formatting {
  static final DateFormat dateFormatTemplate = DateFormat("dd.MM.yyyy 'at' HH:mm:ss");

  static String formatDate(DateTime dateTime) => dateFormatTemplate.format(dateTime);
}