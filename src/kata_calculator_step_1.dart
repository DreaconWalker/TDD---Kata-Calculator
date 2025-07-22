import 'dart:io';

void main() {
  print('Enter two numbers separated by commas:');

  String? numbers = stdin.readLineSync() ?? "";

  int result = add(numbers);

  print('The sum is: $result');
}

int add(String numbers) {
  if (numbers == "" || numbers.isEmpty) {
    return 0;
  }

  List<String> numberList = numbers.split(',');

  int sum = 0;

  if (numberList.length > 2) {
    throw('More than two numbers cannot be added at the moment');
  } else {
    numberList.forEach((number) {
      int num = int.parse(number);
      sum += num;
    });
  }
  return sum;
}
