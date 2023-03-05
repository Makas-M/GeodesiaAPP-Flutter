import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

class Achatamento extends StatefulWidget {
  const Achatamento({super.key});

  @override
  State<StatefulWidget> createState() => Calculadora();
}

class Calculadora extends State<Achatamento> {
  final myFormKey = GlobalKey<FormState>();
  final d = Decimal;
  final e = Decimal;
  final a = TextEditingController();
  final b = TextEditingController();

  String saida1 = "";
  String saida2 = "";

  void latitude() {
    double achat =
        (double.parse(a.text) - double.parse(b.text)) / double.parse(a.text);

    double result = achat;

    double d = result;
    setState(() {
      saida1 = "$d";
    });
  }

//ahora realizaremos el layout o diseño de nuestra calculadora
//de indice de masa corporal
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Achatamento'),
      ),
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

              //agregamos un Container
              Container(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  children: <Widget>[
                    const SizedBox(width: 20),
                    const Text("Semi-eixo maior (a): "),
                    SizedBox(
                      width: 100,
                      height: 20,
                      child: TextFormField(
                        controller: a,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Não pode estar vazio";
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
                    width: 100,
                    height: 20,
                    child: TextFormField(
                      controller: b,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Não pode estar vazio";
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
                    onPressed: latitude,
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

              SizedBox(
                height: 50.0,
                width: 300,
                child: Center(
                  child: Text(
                    ("Achatamento (f): $saida1"),
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
