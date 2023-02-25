// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'Calculadora/Calculadora.dart';
import 'Componentes/Drawer/Drawer.dart';
import 'Componentes/Drawer/informacao.dart';
import 'Componentes/delay.dart';
import 'Dicionario/dicionario.dart';
import 'QUIZ/quiz.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          title: const Text('Geodesia na Mão'),
        ),
        backgroundColor: const Color(0xFFFCFAF8),
        body: ListView(
          children: <Widget>[
            const SizedBox(height: 15.0),
            Container(
              padding: const EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.width - 30.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(30),
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: <Widget>[
                        Card(
                          margin: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () async {
                              await delay(200);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Calculadora(),
                                ),
                              );
                            },
                            splashColor: Colors.grey,
                            child: Center(
                                child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const <Widget>[
                                Icon(Icons.calculate, size: 70.0),
                                Text(
                                  'Calculadora',
                                  style: TextStyle(fontSize: 17.5),
                                )
                              ],
                            )),
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () async {
                              await delay(200);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Dicionario(),
                                ),
                              );
                            },
                            splashColor: Colors.blue,
                            child: Center(
                                child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const <Widget>[
                                Icon(Icons.find_in_page, size: 70.0),
                                Text(
                                  'Dicionário',
                                  style: TextStyle(fontSize: 17.5),
                                )
                              ],
                            )),
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () async {
                              await delay(200);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Quiz(),
                                ),
                              );
                            },
                            splashColor: Colors.red[100],
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const <Widget>[
                                  Icon(Icons.quiz_rounded, size: 70.0),
                                  Text(
                                    'QUIZ',
                                    style: TextStyle(fontSize: 17.5),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () async {
                              await delay(200);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Help(),
                                ),
                              );
                            },
                            splashColor: Colors.grey,
                            child: Center(
                                child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const <Widget>[
                                Icon(Icons.library_books, size: 70.0),
                                Text(
                                  'Biblioteca',
                                  style: TextStyle(fontSize: 17.5),
                                )
                              ],
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
