class SimpleExample {
  final int value;

  SimpleExample(int x) : value = _calculateValue(x) {
    print('1 Constructor Initializer List - value: $value');
  }

  static int _calculateValue(int x) {
    print('2 Calculating value using _calculateValue');
    return x * 2;
  }
}

void main() {
  SimpleExample example = SimpleExample(5);
  print('3 main - value: ${example.value}');
}
