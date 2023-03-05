import 'package:flutter/material.dart';

class Calculadora extends StatelessWidget {
  final List<Tab> myTabs = [
    Tab(text: 'Conversão de Unidades'),
    Tab(text: 'Esfera'),
    Tab(text: 'Elipsoide'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Calculadora'),
            bottom: TabBar(
              tabs: myTabs,
              isScrollable: true,
            ),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item ${index + 1}'),
                  );
                },
              ),
              ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item ${index + 1}'),
                  );
                },
              ),
              ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item ${index + 1}'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
