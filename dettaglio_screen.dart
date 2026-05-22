import 'package:flutter/material.dart';

import '../models/docente.dart';
// schermata dove posso inserire i dettagli del docente
class DocenteDetailScreen extends StatelessWidget {

  final Docente docente;

  const DocenteDetailScreen({
    super.key,
    required this.docente,
  });

  Color colore(String stato) {

    if (stato == "Assente") {
      return Colors.red;
    }

    if (stato == "Ritardo") {
      return Colors.orange;
    }

    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("${docente.nome} ${docente.cognome}"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Row(

              children: [

                CircleAvatar(
                  backgroundColor: colore(docente.stato),
                  radius: 10,
                ),

                const SizedBox(width: 10),

                Text(
                  docente.stato,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Text(
              "👨‍🏫 Nome: ${docente.nome}",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            Text(
              "👨‍🏫 Cognome: ${docente.cognome}",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            Text(
              "📚 Materia: ${docente.materia}",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            Text(
              "📧 Email: ${docente.email}",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            Text(
              "📞 Telefono: ${docente.telefono}",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

            Text(
              "❌ Assenze: ${docente.assenze}",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.red,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "⏱ Ritardi: ${docente.ritardi}",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.orange,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "📝 Motivazione: ${docente.motivazione}",
              style: const TextStyle(fontSize: 18),
            ),

            const Divider(height: 30),

            const Text(
              "📅 Situazione Oraria",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Expanded(

              child: ListView.builder(

                itemCount: 6,

                itemBuilder: (c, i) {

                  return Card(

                    child: ListTile(

                      title: Text("Ora ${i + 1}"),

                      subtitle: Text(

                        docente.statoOre[i] == "In Classe"

                            ? docente.classiOre[i]?.nome ??
                                "Classe non assegnata"

                            : docente.statoOre[i],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}