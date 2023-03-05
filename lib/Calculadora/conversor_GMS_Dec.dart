// ignore_for_file: file_names

import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

class CovertGMStoDEC extends StatefulWidget {
  const CovertGMStoDEC({super.key});

  @override
  State<StatefulWidget> createState() => Calculadora();
}

class Calculadora extends State<CovertGMStoDEC> {
  final latg = TextEditingController();
  final latm = TextEditingController();
  final lats = TextEditingController();
  final long = TextEditingController();
  final lonm = TextEditingController();
  final lons = TextEditingController();
  final myFormKey = GlobalKey<FormState>();
  final d = Decimal;
  final e = Decimal;

  String saida1 = "";
  String saida2 = "";

  //creamos la clase para calcular peso mujer
  void latitude() {
    double latitude = (double.parse(latg.text) +
        double.parse(latm.text) / 60 +
        double.parse(lats.text) / 3600);
    double result = latitude;

    double d = result;
    setState(() {
      saida1 = "$d";
    });

    double longitude = latitude * (3.14 / 180);
    double result1 = longitude;
    double e = result1;

    setState(() {
      saida2 = "$e";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GMS para Dec ou Rad'),
        backgroundColor: Colors.grey,
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

              Container(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  children: <Widget>[
                    const SizedBox(width: 20),
                    const Text("Dados em GMS: "),
                    SizedBox(
                      width: 40,
                      height: 30,
                      child: TextFormField(
                        controller: latg,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Não pode estar vazio";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(hintText: "G"),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const Text('°'),
                    const Divider(),
                    SizedBox(
                      width: 40,
                      height: 30,
                      child: TextFormField(
                        controller: latm,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Não pode estar vazio";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "M",
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const Text("'"),
                    SizedBox(
                      width: 40,
                      height: 30,
                      child: TextFormField(
                        controller: lats,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Não pode estar vazio";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "S",
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const Text('"'),
                  ],
                ),
              ),

              const Divider(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: latitude,
                    child: Column(
                      children: const <Widget>[Text('Converter')],
                    ),
                  ),
                  const VerticalDivider(),
                ],
              ),
              const Divider(
                height: 40.0,
              ),
              //caja de resultado
              SizedBox(
                height: 50.0,
                width: 300,
                child: Center(
                  child: Text(
                    ("Graus Decimais: $saida1"),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
                width: 300,
                child: Center(
                  child: Text(
                    "Radianos: $saida2",
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
