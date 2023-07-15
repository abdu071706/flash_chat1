import 'package:flutter/material.dart';

import 'misal_page.dart';

class MisalEki extends StatefulWidget {
  const MisalEki({Key?key}) : super(key: key);

  @override
  _MisalEkiState createState() => _MisalEkiState();
}

class _MisalEkiState extends State<MisalEki> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(constOzgorboit)),
      body: Center(
        child: Text(
          'Better',
          style: TextStyle(fontSize: 45.0),
        ),
      ),
    );
  }
}
