import 'dart:convert';

import 'package:http/http.dart' as http;

Future main() async {
  final json = await fetch();
  print(json);
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

Future<Map> fetch() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
  var response = await http.get(url);
  var json = jsonDecode(response.body);
  return json;
}
