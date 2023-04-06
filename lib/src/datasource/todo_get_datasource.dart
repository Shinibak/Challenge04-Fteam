import 'local_service/hive_local_storage_service.dart';

abstract class ITodoGetDatasource {
  Future<String> getDataSource(String key);
}

class TodoGetDatasource implements ITodoGetDatasource {
  final ILocalStorageService _service;

  TodoGetDatasource(this._service);

  @override
  Future<String> getDataSource(String key) async {
    final response = await _service.get(key);
    return response;
  }
}
