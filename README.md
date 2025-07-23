# TDD---Kata-Calculator
A String Kata Calculator following a TDD in dart

This TDD Kata Calculator tries to handle five cases as mentioned below

Create a simple String calculator with a method signature like this:

Step 1. int add(string numbers)
   Input: a string of comma-separated numbers
   Output: an integer, sum of the numbers
   Examples:

   Input: “”, Output: 0
   Input: “1”, Output: 1
   Input: “1,5”, Output: 6
Step 2. Allow the add method to handle any amount of numbers.

Step 3. Allow the add method to handle new lines between numbers (instead of commas). ("1\n2,3"   should return 6)

Step 4. Support different delimiters:

To change the delimiter, the beginning of the string will contain a separate line that      looks like this: "//[delimiter]\n[numbers…]". For example, "//;\n1;2" where the delimiter is ";" should return 3.

Step 5. Calling add with a negative number will throw an exception: "negative numbers not allowed <negative_number>".
If there are multiple negative numbers, show all of them in the exception message, separated by commas.



===>>>  Steps to run kata_calculator in terminal 

=> navigate to the directory from the project example :- cd src
=> type :- dart run kata_calculator_step_1.dart

note :- change the name of the file as needed to run the file

===>>> Steps to run unit test cases on the respective kata_calculator step

=> navigate to the unit test case directory from the project 
=> type dart run --enable-asserts unit_test_case_2.dart


Flutter App - Kata Calculator 

- Single Page app using basic setState and finally tested function from previous dart function and unit tests 
- just added it to a StringCalculator class and added unit tests using flutter test package for the same


Screenshots of the same are as available below :- 

Basic Use Case:-

![alt]https://github.com/DreaconWalker/TDD---Kata-Calculator/blob/main/flutter_app/tdd_kata_calculator/screenshots/basic_usecase.png

Custom Delimiter:- 

![alt]https://github.com/DreaconWalker/TDD---Kata-Calculator/blob/main/flutter_app/tdd_kata_calculator/screenshots/custom_delimiter_usecase.png

Error UseCase:-

![alt]https://github.com/DreaconWalker/TDD---Kata-Calculator/blob/main/flutter_app/tdd_kata_calculator/screenshots/error_usecase.png
