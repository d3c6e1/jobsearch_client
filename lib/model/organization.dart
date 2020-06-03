import 'package:jobsearch_client/model/model.dart';

class Organization {
  int id;
  String name;
  int owner;
  List<Vacancy> vacancies;

  Organization({this.id, this.name, this.vacancies, this.owner});

  Organization.fromMap(Map<String, dynamic> map){
    id = map['id'];
    name = map['name'];
    owner = map['owner']['id'];

    if (map.containsKey('vacancies') && map['vacancies'] != null) {
      vacancies = List<Vacancy>();
      map['documents'].forEach((vacancy) {
        vacancies.add(Vacancy.fromMap(vacancy));
      });
    }
  }

  Map<String, dynamic> asMap() =>{
    'id': id,
    'name': name,
    'vacancies': vacancies,
    'owner':{
      'id': owner,
    },
  };
}