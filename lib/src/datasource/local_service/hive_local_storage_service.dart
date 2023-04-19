import 'package:hive/hive.dart';

abstract class ILocalStorageService {
  Future<String> get(String url);
  Future put(String url, String toDo);
}

class HiveLocalStorageService implements ILocalStorageService {
  final Box _box= Hive.box('myBox');

  @override
  Future put(String url, String toDo) async {
    await _box.put(url, toDo);
  }

  @override
  Future<String> get(String url) async {
    final response = await _box.get(url);
    return response;
  }
}
