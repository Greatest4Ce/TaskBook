import 'package:to_do_list_new/data/local_storage/local_storage_util.dart';

class LocalStorageModule {
  static final LocalStorageUtil _localStorageUtil = LocalStorageUtil();

  static LocalStorageUtil localStorageUtil() {
    return _localStorageUtil;
  }
}
