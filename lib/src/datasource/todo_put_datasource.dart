import 'local_service/hive_local_storage_service.dart';

abstract class ITodoPutDatasource {
  Future putDataSource(String key, String put);
}

class TodoPutDatasource implements ITodoPutDatasource {
  final ILocalStorageService _service;

  TodoPutDatasource(this._service);

  @override
  Future putDataSource(String key,String put) async {
    await _service.put(key, put);
  }
}
