void main() {
  // var future = Future.delayed(Duration(seconds: 2));
  // future.then((value) => print('4'));
  print4();
  print('1');
  print('2');
  print('3');

  // for (var i = 1; i <= 3; i++) {
  //   print('1');
  // }
}

Future<void> print4() async {
  await Future.delayed(Duration(milliseconds: 200));
  print('4');
}
