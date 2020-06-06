import 'package:jobsearch_client/locator.dart';
import 'package:jobsearch_client/model/model.dart';
import 'package:jobsearch_client/services/services.dart';

class ResumeViewModel {

  static Future<CV> getResumeData(int id) async {
    Response response = await locator<Store>().executeClientRequest(Request.get('/cvs/$id'));

    if (response.statusCode == 200) {
      return CV.fromMap(response.body);
    }
    // TODO error handle
    return null;
  }
}