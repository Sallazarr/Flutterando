import 'package:api_project_flutterando/app/models/todo_model.dart';
import 'package:dio/dio.dart';

class ToDoRepository {
  final dio = Dio();
  final url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<ToDoModel>> fetchToDos() async {
    final response = await dio.get(url);
    final list = response.data as List;
    List<ToDoModel> toDos = [];
    for (var json in list) {
      final toDo = ToDoModel.fromJson(json);
      toDos.add(toDo);
    }
    return toDos;
  }
}
