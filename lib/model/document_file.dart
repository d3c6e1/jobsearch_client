import 'package:jobsearch_client/model/model.dart';

enum _DocumentFileType {
  passport, other
}

class DocumentFile {
  int id;
  _DocumentFileType type;
  String filePath;
  User owner;
}