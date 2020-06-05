import 'package:get_it/get_it.dart';
import 'package:jobsearch_client/services/services.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());

}