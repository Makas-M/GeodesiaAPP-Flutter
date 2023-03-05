import 'dart:math';

import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

class RaioParalelo extends StatefulWidget {
  const RaioParalelo({super.key});

  @override
  State<StatefulWidget> createState() => Calculadora();
}

class Calculadora extends State<RaioParalelo> {
  final latg = TextEditingController();
  final latm = TextEditingController();
  final lats = TextEditingController();
  final long = TextEditingController();
  final lonm = TextEditingController();
  final lons = TextEditingController();
  final myFormKey = GlobalKey<FormState>();
  final d = Decimal;
  final e = Decimal;
  final raio = TextEditingController();

  String saida1 = "";
  String saida2 = "";

  void latitude() {
    double latitude = (double.parse(latg.text) +
        double.parse(latm.text) / 60 +
        double.parse(lats.text) / 3600);

    double raioP = cos(latitude * 3.14 / 180) * 6371;

    double result = raioP;

    double d = result;
    setState(() {
      saida1 = "$d";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Raio do Paralelo'),
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
                    const Text("Latitude do Paralelo: "),
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
                    ("Raio do Paralelo:  $saida1 Km"),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 40.0,
              ),
              const SizedBox(
                height: 50.0,
                width: 300,
                child: Center(
                  child: Text(
                    ("Curiosidade: O raio da Terra é uma distância aproximada do centro da Terra à superfície, cerca de 6 371 km."),
                    style: TextStyle(
                      fontSize: 14.0,
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
