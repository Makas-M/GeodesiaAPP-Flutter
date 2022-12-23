//toda informacao sobre a versao do aplicativo, o desenvolvedor e email do desenvolvedor

import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[300],
      content: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: const [
                Icon(Icons.info_rounded),
                SizedBox(width: 10),
                Text(
                  'Informação',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                )
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Geodesia na Mão',
              style: TextStyle(color: Colors.black, fontSize: 15.0),
            ),
            const SizedBox(height: 20),
            const Text(
              'Versão do Aplicativo: teste',
              style: TextStyle(color: Colors.black, fontSize: 15.0),
            ),
            const SizedBox(height: 20),
            const Text(
              'Desenvolvido por: Antóno Fernando Macaringue',
              style: TextStyle(color: Colors.black, fontSize: 15.0),
            ),
            const SizedBox(height: 20),
            const Text(
              'Contacto: antoniomacaringue27@gmail.com',
              style: TextStyle(color: Colors.black, fontSize: 15.0),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back))
          ],
        ),
      ),
    );
  }
}
