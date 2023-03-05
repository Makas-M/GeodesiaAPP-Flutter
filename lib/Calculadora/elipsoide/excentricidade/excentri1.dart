import 'dart:math';

import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

class Excentr1 extends StatefulWidget {
  const Excentr1({super.key});

  @override
  State<StatefulWidget> createState() => Calculadora();
}

class Calculadora extends State<Excentr1> {
  final myFormKey = GlobalKey<FormState>();
  final d = Decimal;
  final e = Decimal;
  final a = TextEditingController();
  final b = TextEditingController();

  String saida1 = "";
  String saida2 = "";

  // ignore: non_constant_identifier_names
  void Excentri() {
    double excentr = sqrt((double.parse(a.text) * double.parse(a.text)) -
            (double.parse(b.text) * double.parse(b.text))) /
        double.parse(a.text);

    double result = excentr;

    double d = result;
    setState(() {
      saida1 = "$d";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: myFormKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Stack(
                children: const <Widget>[
                  Align(
                    alignment: Alignment.center,
                  )
                ],
              ),

              Container(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  children: <Widget>[
                    const SizedBox(width: 20, height: 40),
                    const Text("Semi-eixo maior (a): "),
                    SizedBox(
                      width: 150,
                      height: 20,
                      child: TextFormField(
                        controller: a,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Preencha";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: " ",
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: <Widget>[
                  const SizedBox(width: 20),
                  const Text("Semi-eixo menor (b): "),
                  SizedBox(
                    width: 150,
                    height: 20,
                    child: TextFormField(
                      controller: b,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Preencha";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: " ",
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: Excentri,
                    child: Column(
                      children: const <Widget>[Text('Calcular')],
                    ),
                  ),
                  const VerticalDivider(),
                ],
              ),
              const Divider(
                height: 40.0,
              ),
//Saida
              SizedBox(
                height: 50.0,
                width: 300,
                child: Center(
                  child: Text(
                    ("Excentricidade (e): $saida1"),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 40.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
