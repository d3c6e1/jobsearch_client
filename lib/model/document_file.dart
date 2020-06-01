enum _DocumentFileType {
  passport, other
}

class DocumentFile {
  int id;
  _DocumentFileType type;
  String filePath;
  int owner;

  DocumentFile({this.id, this.type, this.filePath, this.owner});

  DocumentFile.fromMap(Map<String, dynamic> map){
    id = map['id'];
    type = map['type'];
    filePath = map['filePath'];
    owner = map['owner']['id'];
  }

  Map<String, dynamic> asMap() =>{
    'id': id,
    'type': type,
    'filePath': filePath,
    'owner':{
      'id': owner,
    },
  };
}