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

  String delimiter = ',|\n';
  String numberPart = numbers;

  if (numbers.startsWith('//')) {
    final delimiterEnd = numbers.indexOf('\n');
    delimiter = RegExp.escape(numbers.substring(2, delimiterEnd));
    numberPart = numbers.substring(delimiterEnd + 1);
  }

  final parts = numberPart.split(RegExp('[,\\n$delimiter]'));
  
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


