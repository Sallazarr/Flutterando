import 'package:api_project_flutterando/app/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final repository = ToDoRepository();
  test('trazer uma lista de ToDoModel', () async {
    final list = await repository.fetchToDos();
    print(list);
  });
}
