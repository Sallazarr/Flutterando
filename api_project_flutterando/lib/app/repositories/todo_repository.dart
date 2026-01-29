import 'package:api_project_flutterando/app/models/todo_model.dart';
import 'package:dio/dio.dart';

class ToDoRepository {
  late Dio dio;
  final url = 'https://jsonplaceholder.typicode.com/todos';

  ToDoRepository([Dio? client]) : dio = client ?? Dio();

  Future<List<ToDoModel>> fetchToDos() async {
    final response = await dio.get(url);
    final list = response.data as List;
    return list.map((json) => ToDoModel.fromJson(json)).toList();
  }
}
