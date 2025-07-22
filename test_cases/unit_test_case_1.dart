import '../src/kata_calculator_step_1.dart';

void main() {
  testBasicAdditionOfTwoNumbers();
}

void testBasicAdditionOfTwoNumbers() {
  print('Running tests for addition of two numbers');

  if(add("1,2") == 3){
    print('Test passed: 1 + 2 = 3');
  } else {
    print('Test failed: Expected 3 but got ${add("1,2")}');
  }

  if(add("") == 0){
    print('Test passed: " = 0');
  } else {
    print('Test failed: Expected 0 but got ${add("")}');
  }

  if(add("1") == 1){
    print('Test passed: 1 = 1');
  } else {
    print('Test failed: Expected 1 but got ${add("1")}');
  }

  if(add("1,2,3") == 0){
    print('Test passed:  1+2+3 returns More than two numbers cannot be added at the moment');
  } else {
    print('Test failed: Expected 0 but got ${add("1,2,3")}');
  }

}


