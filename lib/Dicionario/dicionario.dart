import 'package:flutter/material.dart';

class Dicionario extends StatefulWidget {
  const Dicionario({super.key});

  @override
  State<StatefulWidget> createState() => Dic();
}

class Dic extends State<Dicionario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Dicionario'), backgroundColor: Colors.grey),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: const [
            Text('Geoide: Uma superficie irregular',
                style: TextStyle(fontSize: 20.0)),
          ],
        ),
      ),
    );
  }
}
