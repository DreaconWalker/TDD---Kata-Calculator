import '../src/kata_calculator_step_2.dart';

// to test failed scenario for line 34, and 41 uncomment the line below and comment the line above
// import '../src/kata_calculator_step_1.dart';

void main() {
  testAdditionOfNumbers();
}

void testAdditionOfNumbers() {
  print('Running tests for addition of multiple numbers');

  try {
    assert(add("1,2") == 3);
    print('Test passed: 1 + 2 = 3');
  } catch (e) {
    print('Test failed: Expected 3 but got ${add("1,2")} - $e');
  }

  try {
    assert(add("") == 0);
    print('Test passed: "" = 0');
  } catch (e) {
    print('Test failed: Expected 0 but got - $e');
  }

  try {
    assert(add("1") == 1);
    print('Test passed: 1 = 1');
  } catch (e) {
    print('Test failed: Expected 1 but got - $e');
  }

  try {
    assert(add("1,2,3") == 6);
    print('Test passed: 1 + 2 + 3 = 6');
  } catch (e) {
    print('Test failed: Expected 6 but got - $e');
  }

  try {
    assert(add("10,20,30,40") == 100);
    print('Test passed: 10 + 20 + 30 + 40 = 100');
  } catch (e) {
    print('Test failed: Expected 100 but got  - $e');
  }

}


