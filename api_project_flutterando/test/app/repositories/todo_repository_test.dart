import 'package:api_project_flutterando/app/repositories/todo_repository.dart';
import 'package:dio/src/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final repository = ToDoRepository(dio as Dio?);
  test('trazer uma lista de ToDoModel', () async {
    final list = await repository.fetchToDos();
    print(list);
  });
}
