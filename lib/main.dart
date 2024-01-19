import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key})
      : super(key: key); // Use 'Key?' instead of 'super.key'

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextField',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch:
                Colors.deepPurple), // Use 'fromSwatch' instead of 'fromSeed'
        useMaterial3: true,
      ),
      home: const MyTextField(), // Use 'MyTextField' instead of 'TextField'
    );
  }
}

class MyTextField extends StatefulWidget {
  const MyTextField({Key? key})
      : super(key: key); // Use 'Key?' instead of 'super.key'

  @override
  State<MyTextField> createState() =>
      _MyTextFieldState(); // Rename to 'MyTextField' to avoid conflicts
}

class _MyTextFieldState extends State<MyTextField> {
  late String texttodisplay;
  late String textinputted;

  @override
  void initState() {
    super.initState();
    texttodisplay = ''; // Initialize texttodisplay
    textinputted = ''; // Initialize textinputted
  }

  void change() {
    setState(() {
      texttodisplay = textinputted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ignore: unnecessary_string_interpolations
          Text('$texttodisplay'),
          TextField(
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter Text',
            ),
            onChanged: (value) {
              textinputted = value;
            },
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                change();
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
