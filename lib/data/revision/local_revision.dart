import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list_new/data/revision/local_revision_impl.dart';

class LocalRevisionProvider implements LocalRevisionProviderImpl {
  static const String _key = 'local_revision';
  late SharedPreferences _pref;

  LocalRevisionProvider() {
    _prefs();
  }

  @override
  bool get() {
    final localRevision = _pref.getBool(_key) ?? false;
    return localRevision;
  }

  @override
  Future<void> set(bool localRevision) async {
    await _pref.setBool(_key, localRevision);
  }

  Future<void> _prefs() async {
    _pref = await SharedPreferences.getInstance();
  }
}
