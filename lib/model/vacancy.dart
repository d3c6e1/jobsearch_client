import 'package:jobsearch_client/model/model.dart';

class Vacancy {
  int id;
  String name;
  DateTime publishDate;
  User owner;
  Map<String, dynamic> data;
}