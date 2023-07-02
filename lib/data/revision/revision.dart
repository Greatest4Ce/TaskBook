import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list_new/data/revision/revision_impl.dart';

class RevisionProvider implements RevisionProviderImpl {
  static const String _key = 'revision';
  late SharedPreferences _pref;

  RevisionProvider() {
    _prefs();
  }

  @override
  int get() {
    final revision = _pref.getInt(_key) ?? 0;
    return revision;
  }

  @override
  Future<void> set(int revision) async {
    await _pref.setInt(_key, revision);
  }

  Future<void> _prefs() async {
    _pref = await SharedPreferences.getInstance();
  }
}
