// ignore_for_file: use_build_context_synchronously, file_names

import 'package:flutter/material.dart';
import '../delay.dart';
import 'informacao.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        const UserAccountsDrawerHeader(
          accountName: Text('username'),
          accountEmail: Text('email adress'),
          currentAccountPicture: CircleAvatar(),
        ),
        ListTile(
          leading: const Icon(Icons.stream),
          title: const Text('Como usar'),
          onTap: () async {
            await delay(300);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Help(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Definiçoes'),
          onTap: () async {
            await delay(300);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Help(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('Informação'),
          onTap: () async {
            await delay(300);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Help(),
              ),
            );
          },
        ),
      ]),
    );
  }
}
