import 'package:flutter/material.dart';

class Dicionario extends StatefulWidget {
  const Dicionario({super.key});

  @override
  State<StatefulWidget> createState() => Dic();
}

class Item {
  String title;
  String content;

  Item({required this.title, required this.content});
}

List<Item> items = [
  Item(
      title: 'Azimute',
      content:
          'Azimute é a medida angular da direcção de um objecto em relação ao norte verdadeiro ou magnético. Ele é medido em graus, começando com 0 graus no norte e aumentando no sentido horário até 360 graus, formando um círculo completo.'),
  Item(
      title: 'Nadir',
      content:
          'Nadir é o ponto mais baixo no céu, directamente abaixo do observador. É o oposto do zênite, que é o ponto mais alto no céu acima do observador. O nadir é definido como a direcção oposta à vertical do observador, formando um ângulo de 180 graus em relação ao zênite.'),
  Item(
      title: 'Rumo',
      content:
          'Rumo é a direção em que um objeto está se movendo ou apontando, em relação ao norte verdadeiro ou magnético. É medido em graus, começando com 0 graus apontando para o norte, e aumentando no sentido horário até 360 graus, formando um círculo completo.'),
  Item(
      title: 'Zenite',
      content:
          'Zenite (ou zênite) é o ponto mais alto no céu acima de um observador. É o ponto em que a vertical do observador cruza a esfera celeste. É o oposto do nadir, que é o ponto mais baixo na esfera celeste abaixo do observador.'),
];

class Dic extends State<Dicionario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Dicionario'), backgroundColor: Colors.grey),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionTile(
            title: Text(items[index].title),
            children: <Widget>[
              Container(
                width: 300,
                child: Text(items[index].content,
                    style: const TextStyle(
                      fontSize: 14,
                    )),
              )
            ],
          );
        },
      ),
    );
  }
}
