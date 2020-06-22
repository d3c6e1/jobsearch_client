import 'package:age/age.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  static final DateFormat date_at_time = DateFormat("dd.MM.yyyy 'at' HH:mm:ss");
  static final DateFormat dateDDMMYYYY = DateFormat('dd.MM.yyyy');

  String get dateAtTime => date_at_time.format(this);
  String get date => dateDDMMYYYY.format(this);
  String get getAge => Age.dateDifference(
    fromDate: this, toDate: DateTime.now(),)?.years.toString();
}