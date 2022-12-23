// ignore_for_file: file_names
import 'package:app/Calculadora/terra_esferica/raio_paralelo.dart';
import 'package:flutter/material.dart';
import 'conversor_GMS_Dec.dart';
import 'elipsoide/achatamento.dart';
import 'elipsoide/excentricidade/excentricidade.dart';

class Calculadora extends StatelessWidget {
  const Calculadora({super.key});

  @override
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Calculadora Geodesica'),
            backgroundColor: Colors.grey,
          ),
          body: ListView(children: [
            const SizedBox(height: 20),
            const Text(
              'Conversão de Unidades',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.change_circle),
              title: const Text('GMS para Dec/Rad'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CovertGMStoDEC(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.change_circle),
              title: const Text('GMS para UTM (em desenvolvimento)'),
              onTap: () {},
            ),
            const Text(
              'Terra Esferica',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.change_circle),
              title: const Text('Raio do Paralelo'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RaioParalelo(),
                  ),
                );
              },
            ),
            const Text(
              'Terra Elipsoidal',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.change_circle),
              title: const Text('Achatamento'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Achatamento(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.change_circle),
              title: const Text('Excentricidade'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Excentricidade(),
                  ),
                );
              },
            ),
          ]),
        ),
      );
}
