//MyApp (onde tem os botoes de calculadora, dicionario, quiz e biblioteca)

import 'package:app/Componentes/db_connection.dart';
import 'package:app/QUIZ/modelo.dart';
import 'package:app/tela_inicial.dart';
import 'package:flutter/material.dart';

void main() {
  var db = DBConnection();
  db.addQuestion(
    Question(
      id: '20',
      title: 'title',
      options: {'1': false, '3': false, '4': false, '2': true},
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaInicial(),
    );
  }
}
