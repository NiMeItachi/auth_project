class LocalStorage {
  LocalStorage._();
  static final LocalStorage _instance = LocalStorage._();
  factory LocalStorage() => _instance;

  final Map<String, String> _database = {};

  bool storeData({required String key, required String value}) {
    if(_database.containsKey(key)) {
      return false;
    }

    _database.addAll({key: value});
    return true;
  }

  String? readData({required String key}) {
    return _database[key];
  }

  String? deleteData({required String key}) {
    return _database.remove(key);
  }

  bool updateData({required String key, required String newValue}) {
    try {
      _database.update(key, (oldValue) => newValue);
      return true;
    } catch(e) {
      return false;
    }
  }
}