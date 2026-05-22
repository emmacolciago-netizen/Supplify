import 'package:flutter/material.dart';

import '../models/docente.dart';
import '../models/classe.dart';

class OrarioClassiScreen extends StatelessWidget {

  final List<Docente> docenti;
  final List<Classe> classi;

  const OrarioClassiScreen({
    super.key,
    required this.docenti,
    required this.classi,
  });

  Docente? trova(Classe cl, int ora) {

    for (var d in docenti) {

      if (d.statoOre[ora] == "In Classe" &&
          d.classiOre[ora]?.nome == cl.nome) {
        return d;
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Orario Classi"),
      ),

      body: ListView.builder(

        itemCount: classi.length,

        itemBuilder: (c, i) {

          final cl = classi[i];

          return Card(

            child: Padding(

              padding: const EdgeInsets.all(10),

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(
                    cl.nome,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Divider(),

                  for (int ora = 0; ora < 6; ora++)

                    ListTile(

                      title: Text("Ora ${ora + 1}"),

                      subtitle: Text(

                        trova(cl, ora) != null

                            ? "${trova(cl, ora)!.nome} ${trova(cl, ora)!.cognome}"

                            : "----",
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}