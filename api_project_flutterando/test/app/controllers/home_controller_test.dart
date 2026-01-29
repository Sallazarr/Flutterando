import 'package:api_project_flutterando/app/controllers/home_controller.dart';
import 'package:api_project_flutterando/app/models/todo_model.dart';
import 'package:api_project_flutterando/app/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ToDoRepositoryMock extends Mock implements ToDoRepository {}

main() {
  final repository = ToDoRepositoryMock();
  final controller = HomeController(repository);

  test('deve modificar o estado para error se a req falhar', () async {
    // when(() => repository.fetchToDos()).thenAnswer((_) async => [ToDoModel()]);
    when(() => repository.fetchToDos()).thenThrow(Exception());
    expect(controller.state, HomeState.start);
    await controller.start();
    expect(controller.state, HomeState.error);
    // expect(controller.toDos.isNotEmpty, true);
  });
}
