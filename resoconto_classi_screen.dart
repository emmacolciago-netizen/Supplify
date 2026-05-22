
import 'package:flutter/material.dart';
import '../models/docente.dart';
import '../models/classe.dart';

class ResocontoClassiScreen extends StatelessWidget {

  final List<Docente> docenti;
  final List<Classe> classi;

  const ResocontoClassiScreen({
    super.key,
    required this.docenti,
    required this.classi,
  });

  //  TROVA DOCENTE IN CLASSE
  Docente? trovaDocente(Classe cl, int ora) {

    for (var d in docenti) {

      // se il docente NON è presente non può essere considerato in classe
      if (d.stato != "Presente") {
        continue;
      }

      // il docente assegnato alla classe
      if (d.statoOre[ora] == "In Classe" &&
          d.classiOre[ora] != null &&
          d.classiOre[ora]!.nome == cl.nome) {

        return d;
      }
    }

    return null;
  }

  // TROVA SUPPLENTE AUTOMATICO
  Docente? trovaSupplente(int ora) {

    for (var d in docenti) {

      // controlla che il professore è presente e disponibile per supplenza
      if (d.stato == "Presente" &&
          d.statoOre[ora] == "Disponibile Supplenza") {

        return d;
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Resoconto Classi"),
      ),

      body: ListView.builder(

        itemCount: classi.length,

        itemBuilder: (c, i) {

          final cl = classi[i];

          return Card(

            margin: const EdgeInsets.all(10),

            child: Padding(

              padding: const EdgeInsets.all(10),

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  // NOME CLASSE
                  Text(
                    cl.nome,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Divider(),

                  // ORE
                  for (int ora = 0; ora < 6; ora++)

                    Builder(

                      builder: (_) {

                        final docente = trovaDocente(cl, ora);

                        final supplente = trovaSupplente(ora);

                        return ListTile(

                          title: Text(
                            "Ora ${ora + 1}",
                          ),

                          subtitle:

                              //  docente presente
                              docente != null

                                  ? Text(
                                      "${docente.nome} ${docente.cognome}",
                                    )

                                  // supplente o se classe non ha nessuno 
                                  : Row(

                                      children: [

                                        // pallino per indicare supplenza
                                        if (supplente != null)

                                          const Icon(
                                            Icons.circle,
                                            color: Colors.purple,
                                            size: 12,
                                          ),

                                        if (supplente != null)
                                          const SizedBox(width: 5),

                                        Text(

                                          supplente != null

                                              ? "Supplenza"

                                              : "----",
                                        ),

                                        // nome dupplente
                                        if (supplente != null)

                                          Padding(

                                            padding:
                                                const EdgeInsets.only(left: 10),

                                            child: Text(

                                              supplente.nome,

                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                        );
                      },
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