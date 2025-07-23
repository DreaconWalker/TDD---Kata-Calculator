class StringCalculator {
  int add(String numbers) {
  if (numbers.isEmpty) {
    return 0;
  }

  String delimiterPattern = r',|\n|\\n';
  String numberPart = numbers;

  //custom delimiter handling - used help of ai to implement just the custom delimiter feature
  //but debugged it too to make it work if that counts

  if (numbers.startsWith('//')) {
    // Look for either actual newline or literal \n
    int delimiterEnd = numbers.indexOf('\n');
    if (delimiterEnd == -1) {
      delimiterEnd = numbers.indexOf('\\n');
      if (delimiterEnd == -1) {
        throw ArgumentError('Invalid format: missing newline after custom delimiter');
      }
      // Handle literal \n case
      final customDelimiter = numbers.substring(2, delimiterEnd);
      delimiterPattern = '[,\n${RegExp.escape(customDelimiter)}]';
      numberPart = numbers.substring(delimiterEnd + 2); // Skip the length of \n
    } else {
      // Handle actual newline case
      final customDelimiter = numbers.substring(2, delimiterEnd);
      delimiterPattern = '[,\n${RegExp.escape(customDelimiter)}]';
      numberPart = numbers.substring(delimiterEnd + 1);
    }
  }

  final parts = numberPart.split(RegExp(delimiterPattern));
  
  int sum = 0;
  List<int> negatives = [];

 for (var part in parts) {
    if (part.isNotEmpty) {
      int number = _processStringToNumberForAddition(part);
      
      if (number < 0) {
        negatives.add(number);
      } else {
          sum += number;
      }
    }
  }

   if (negatives.isNotEmpty) {
    throw ArgumentError('negatives not allowed: ${negatives.join(', ')}');
  }


  return sum;
}

int _processStringToNumberForAddition(String number) {
  try {
    return int.parse(number);
  } catch (e) {
    throw ArgumentError('Invalid number format: "$number"');
  }
}
}