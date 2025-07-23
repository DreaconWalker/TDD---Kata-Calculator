import 'package:flutter/material.dart';
import 'package:tdd_kata_calculator/kata_string_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kata Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: true,
      ),
      home: const KataCalculatorScreen(),
    );
  }
}

class KataCalculatorScreen extends StatefulWidget {
  const KataCalculatorScreen({super.key});

  @override
  _KataCalculatorScreenState createState() => _KataCalculatorScreenState();
}

class _KataCalculatorScreenState extends State<KataCalculatorScreen> {
  final StringCalculator calculator = StringCalculator();
  final TextEditingController inputController = TextEditingController();
  int result = 0;
  String errorMessage = '';
  
  void _calculate() {
    setState(() {
      errorMessage = '';
      try {
        String input = inputController.text;
        result = calculator.add(input);
      } catch (e) {
        errorMessage = e.toString().replaceFirst('Exception: ', '');
        result = 0;
      }
    });
  }
    
  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('String Calculator'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Instructions: Calculator can handle the following only:',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      const Text('1• Enter comma-separated numbers: "1,2"'),
                      const Text('2• Enter multiple numbers: "1,2,3"'),
                      const Text('3• Use newlines as delimiters: "1,2\\n3"'),
                      const Text('4• Custom delimiter: "//;\\n1;2;3"'),
                      const Text('5• Negative numbers will show an error'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            controller: inputController,
                            decoration: const InputDecoration(
                              labelText: ' Enter String as in instructions',
                              border: OutlineInputBorder(),
                              hintText: 'e.g., 1,2,3 or //;\n1;2;3',
                            ),
                            onSubmitted: (_) => _calculate(),
                            maxLines: 1
                          ),
                        ),
                      ],
                    ),
                  ),
              
              const SizedBox(height: 16),
              
              Card(
                color: errorMessage.isNotEmpty 
                    ? Colors.red.shade50 
                    : Colors.green.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      if (errorMessage.isNotEmpty) ...[
                        const Icon(Icons.error, color: Colors.red, size: 32),
                        const SizedBox(height: 8),
                        Text(
                          'Error',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          errorMessage,
                          style: const TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      ] else ...[
                        const Icon(Icons.calculate, color: Colors.green, size: 32),
                        const SizedBox(height: 8),
                        Text(
                          'Result',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          result.toString(),
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              ElevatedButton.icon(
                onPressed: _calculate,
                icon: const Icon(Icons.calculate),
                label: const Text('Calculate'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
