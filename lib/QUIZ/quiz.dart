import 'dart:collection';
import 'dart:math';

import 'package:app/QUIZ/constantes.dart';
import 'package:app/QUIZ/next_button.dart';
import 'package:app/QUIZ/option_Card.dart';
import 'package:app/QUIZ/question_widget.dart';
import 'package:app/QUIZ/result_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

import 'modelo.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<Question> _questions = [
    Question(
        id: '10',
        title: 'Qual é aproximadamente o raio da terra?',
        options: {
          '6371 cm': false,
          '6731 Km': false,
          '6371 m': false,
          '6371 km': true,
        }),
    Question(
        id: '11',
        title: 'Qual é o campo da Geodesia que Estuda a gravidade?',
        options: {
          'Geodesia Terrestre': false,
          'Geodesia Fisica': true,
          'Geodesia Espacial': false,
          'Nenhuma das opcoes': false,
        }),
    Question(
        id: '12',
        title: 'Qual é o valor médio da gravidade na terra?',
        options: {
          '100 gal': false,
          '9.8 gal': false,
          '908.3 km': false,
          '908.3 gal': true,
        }),
    Question(id: '13', title: 'Maputo localiza-se na Zona:', options: {
      '25': false,
      '36': true,
      '37': false,
      '42': false,
    }),
    Question(
        id: '14',
        title: 'O codigo 4326 corresponde a que sistema de coordenadas?',
        options: {
          'WGS84': true,
          'Moznet 36S': false,
          'Tete': false,
          'Moznet': false,
        }),
    Question(
        id: '15',
        title: 'Quais são os limites meridionais da zona 31?',
        options: {
          '36E - 42E': false,
          '28E - 34E': false,
          '0E - 6E': true,
          'Nenhuma das opçoes': false,
        }),
    Question(
        id: '16',
        title: 'Quando se trata da projeção UTM quantas zonas existem?',
        options: {
          '20 zonas': false,
          '30 zonas': false,
          '6 zonas': false,
          '60 zonas': true,
        }),
    Question(id: '17', title: 'Quais são as tres leis de Kepler?', options: {
      'Peridos, orbitas e áreas': true,
      'gravidade, inercia e peridos': false,
      'orbitas, terrestres, aereas': false,
      'Nenhuma das opçoes': false,
    }),
    Question(
        id: '18',
        title:
            'Qual é o nome do instrumento usado para medir a gravidade directamente da superfice terrestre?',
        options: {
          'Gravitador': false,
          'Gravimetro': true,
          'Campo de Gravidade': false,
          'factor gravidade': false,
        }),
    Question(id: '19', title: 'O que significa GPS?', options: {
      'Global Position System': true,
      'Global Position Satelite': false,
      'Geographic Position System': false,
      'Geography per Square': false,
    }),
  ];
  int arredondar(ranks) {
    return (((score * 1 / 10) * 10) * ranks).round();
  }

  int index = 0;
  int score = 0;
  bool isPressed = false;
  bool isAlreadySelected = false;
  void nextQuestion() {
    //condicao para mostrar caixa de resultados
    if (score == 10) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => ResultBox(
          result: score,
          questionlength: _questions.length,
          onPressed: startOver,
        ),
      );
      return;
    } else {
      if (isPressed) {
        setState(() {
          index = Random().nextInt(10);
          Set<int> resultados = HashSet<int>();
          resultados.add(index);

          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Porfavor selecione uma opção'),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(vertical: 20.0),
          ),
        );
      }
    }
  }

  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        title: const Text('Quiz - Geodesia'),
        backgroundColor: Colors.blue,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Column(children: [
              const SizedBox(height: 20),
              FAProgressBar(
                currentValue: (((score * 1 / 10) * 10)),
                size: 30,
                maxValue: 10,
                changeColorValue: 8,
                changeProgressColor: Colors.green,
                backgroundColor: Colors.white,
                progressColor: Colors.grey,
                animatedDuration: const Duration(milliseconds: 500),
                direction: Axis.horizontal,
                verticalDirection: VerticalDirection.up,
                displayText: ' /10',
                displayTextStyle: const TextStyle(fontSize: 16),
                formatValueFixed: 2,
              ),
            ]),
            const SizedBox(height: 20),
            QuestionWidget(
                question: _questions[index].title,
                indexAction: index,
                totalQuestions: _questions.length),
            const Divider(color: Colors.black),
            const SizedBox(height: 20.0),
            //mexer para fazer random das perguntas
            for (int i = 0; i < _questions[index].options.length; i++)
              GestureDetector(
                onTap: () => checkAnswerAndUpdate(
                    _questions[index].options.values.toList()[i]),
                child: OptionCard(
                  option: _questions[index].options.keys.toList()[i],
                  color: isPressed
                      ? _questions[index].options.values.toList()[i] == true
                          ? correct
                          : incorrect
                      : neutral,
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(nextQuestion: nextQuestion),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
