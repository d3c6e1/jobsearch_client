import 'package:jobsearch_client/model/model.dart';

class CV{
  int id;
  String name;
  DateTime publishDate;
  int owner;
  CVData data;

  CV({this.id, this.name, this.publishDate, this.owner, this.data});

  CV.fromMap(Map<String, dynamic> map){
    id = map['id'];
    name = map['name'];
    publishDate = DateTime.parse(map['publishDate']);
    owner = map['owner']['id'];
    data = CVData.fromMap(map['data']);
  }

  Map<String, dynamic> asMap() => {
    'id': id,
    'name': name,
    'publishDate': publishDate,
    'owner':{
      'id': owner,
    },
    'data': data,
  };
}