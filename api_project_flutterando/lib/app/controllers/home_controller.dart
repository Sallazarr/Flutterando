import 'package:api_project_flutterando/app/models/todo_model.dart';
import 'package:api_project_flutterando/app/repositories/todo_repository.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  List<ToDoModel> toDos = [];
  late final ToDoRepository _repository;
  final state = ValueNotifier<HomeState>(HomeState.start);

  HomeController([ToDoRepository? repository])
    : _repository = repository ?? ToDoRepository();

  // ignore: empty_constructor_bodies
  Future start() async {
    state.value = HomeState.loading;

    try {
      toDos = await _repository.fetchToDos();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, success, error }
