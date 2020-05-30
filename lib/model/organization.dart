import 'package:jobsearch_client/model/model.dart';

class Organization {
  int id;
  String name;
  User owner;
  List<Vacancy> vacancies;
}