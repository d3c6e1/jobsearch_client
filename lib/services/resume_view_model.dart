import 'dart:convert';

import 'package:jobsearch_client/locator.dart';
import 'package:jobsearch_client/model/model.dart';
import 'package:jobsearch_client/services/services.dart';

class ResumeViewModel {
  final Store _store = locator<Store>();

  CV _cv;

  CV get cv => _cv;

  Future getResumeData(int id) async {
    Response response = await _store.executeUserRequest(Request.get('/cvs/$id'));

    if (response.statusCode == 200) {
      return CV.fromMap(json.decode(response.body));
    }
    // TODO error handle
  }
}