// ignore_for_file: use_build_context_synchronously

import 'package:app/QUIZ/constantes.dart';
import 'package:flutter/material.dart';
import '../Componentes/delay.dart';
import '../tela_inicial.dart';

class ResultBox extends StatelessWidget {
  const ResultBox(
      {super.key,
      required this.result,
      required this.questionlength,
      required this.onPressed});
  final int result;
  final int questionlength;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: background,
        content: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Pontuação',
                style: TextStyle(color: neutral, fontSize: 20.0),
              ),
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 60.0,
                backgroundColor: result == questionlength
                    ? correct
                    : result < questionlength / 2
                        ? incorrect
                        : result == questionlength / 2
                            ? Colors.green
                            : Colors.red,
                child: Text(
                  '$result/$questionlength',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 25.0),
              Row(children: [
                ElevatedButton(
                  onPressed: onPressed,
                  child: const Icon(Icons.arrow_back_sharp),
                ),
                const SizedBox(width: 30),
                ElevatedButton(
                  onPressed: () async {
                    await delay(300);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const TelaInicial(),
                      ),
                    );
                  },
                  child: const Text('Sair'),
                )
              ]),
            ],
          ),
        ));
  }
}
