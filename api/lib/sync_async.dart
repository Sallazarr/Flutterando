import 'dart:convert';

import 'package:http/http.dart' as http;

Future main() async {
  final todo = await fetch();
  print(todo.toJson());
  // var future = Future.delayed(Duration(seconds: 2));
  // future.then((value) => print('4'));
  //   print4();
  //   print('1');
  //   print('2');
  //   print('3');

  //   // for (var i = 1; i <= 3; i++) {
  //   //   print('1');
  //   // }
  // }

  // Future<void> print4() async {
  //   await Future.delayed(Duration(milliseconds: 200));
  //   print('4');
}

Future<ToDo> fetch() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
  var response = await http.get(url);
  var json = jsonDecode(response.body);
  var todo = ToDo.fromJson(json);
  return todo;
}

// {
//   "userId": 1,
//   "id": 1,
//   "title": "delectus aut autem",
//   "completed": false
// }

class ToDo {
  final String title;
  final int id;
  final int userId;
  final bool completed;

  ToDo({
    required this.title,
    required this.id,
    required this.userId,
    required this.completed,
  });

  factory ToDo.fromJson(Map json) {
    return ToDo(
      title: json['title'],
      id: json['id'],
      userId: json['userId'],
      completed: json['completed'],
    );
  }

  Map toJson() {
    return {'title': title, 'id': id, 'userId': userId, 'completed': completed};
  }
}
