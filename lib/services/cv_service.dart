import 'package:jobsearch_client/model/model.dart';
import 'package:jobsearch_client/services/services.dart';

class CVService extends ServiceController<CV>{
  CVService(this.store);

  Store store;

  CV _recentCV;

  clearCache() {
    _recentCV = null;
  }

  Future<CV> getCV(int id) async {
    var req = Request.get('/cvs/$id');
    var response = await store.executeClientRequest(req);

    if (response.error != null) {
      addError(response.error);
      return null;
    }

    switch (response.statusCode) {
      case 200: {
        _recentCV = CV.fromMap(response.body);
        add(_recentCV);
        return _recentCV;
      } break;
      default: addError(APIError(response.body["error"]));
    }
    return null;
  }
}