import 'package:flutter/material.dart';
import '../models/docente.dart';

class ResocontoDocentiScreen extends StatelessWidget {

  final List<Docente> docenti;

  const ResocontoDocentiScreen({
    super.key,
    required this.docenti,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Resoconto Docenti"),
      ),

      body: ListView.builder(

        itemCount: docenti.length,

        itemBuilder: (c, i) {

          final d = docenti[i];

          return Card(

            child: ExpansionTile(

              title: Text("${d.nome} ${d.cognome}"),

              subtitle: Text(d.stato),

              children: [

                Text("Assenze: ${d.assenze}"),
                Text("Ritardi: ${d.ritardi}"),

                const Divider(),

                for (int ora = 0; ora < 6; ora++)

                  ListTile(

                    title: Text("Ora ${ora + 1}"),

                    subtitle: Text(

                      d.statoOre[ora] == "In Classe"

                          ? d.classiOre[ora]?.nome ?? "Nessuna classe"

                          : d.statoOre[ora],
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}