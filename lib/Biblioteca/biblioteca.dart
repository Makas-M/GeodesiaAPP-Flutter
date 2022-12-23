import 'package:flutter/material.dart';

class Biblioteca extends StatefulWidget {
  const Biblioteca({super.key});

  @override
  State<StatefulWidget> createState() => Dic();
}

class Dic extends State<Biblioteca> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Biblioteca'), backgroundColor: Colors.grey),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: const [
            Text('Em desenvolvimento...', style: TextStyle(fontSize: 20.0)),
          ],
        ),
      ),
    );
  }
}
