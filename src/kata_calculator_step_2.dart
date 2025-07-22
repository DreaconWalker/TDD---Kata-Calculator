import 'dart:io';

void main() {
  print('Enter numbers separated by commas:');

  String? numbers = stdin.readLineSync() ?? "";

  int result = add(numbers);

  print('The sum is: $result');
}

int add(String numbers) {
  if (numbers.isEmpty) {
    return 0;
  }

  final parts = numbers.split(',');
  int sum = 0;

  for (var part in parts) {
    if (part.isNotEmpty) {
      sum += _processStringToNumberForAddition(part);
    }
  }

  return sum;
}

int _processStringToNumberForAddition(String number) {
  int result = int.parse(number);
  return result;
}
