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

  numbers = numbers.replaceAll(r'\n', ',');
  
  final parts = numbers.split(RegExp(r'[,\n]'));
  int sum = 0;

  for (var part in parts) {
    if (part.isNotEmpty) {
      sum += _processStringToNumberForAddition(part);
    }
  }

  return sum;
}

int _processStringToNumberForAddition(String number) {
  int result = int.parse(number.trim());
  return result;
}
