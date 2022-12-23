import 'package:flutter/material.dart';
import 'excentr2.dart';
import 'excentri1.dart';

class Excentricidade extends StatelessWidget {
  const Excentricidade({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Excentricidade'),
            backgroundColor: Colors.grey,
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'com Semi-eixos',
                ),
                Tab(
                  text: 'com Achatamento',
                ),
              ],
            ),
          ),
          body: const TabBarView(children: [
            Excentr1(),
            Excentr2(),
          ]),
        ),
      );
}
