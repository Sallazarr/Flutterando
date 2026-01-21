void main() {
  print(stringToInt('a'));
}

int stringToInt(String text) {
  int value;
  try {
    value = int.parse(text);
  } catch (e) {
    throw Exception('The system received a letter, Text: ($text)');
  }
  return value;
}
