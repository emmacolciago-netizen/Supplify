import 'package:flutter/material.dart';
import '../models/docente.dart';

class PresenzeScreen extends StatefulWidget {

  final List<Docente> docenti;

  const PresenzeScreen({
    super.key,
    required this.docenti,
  });

  @override
  State<PresenzeScreen> createState() => _PresenzeScreenState();
}

class _PresenzeScreenState extends State<PresenzeScreen> {

  final stati = [
    "Presente",
    "Assente",
    "Ritardo",
  ];

  final motivi = [
    "",
    "Malattia",
    "Ferie",
    "Gita",
    "Visita medica",
  ];

  Color colore(String stato) {

    if (stato == "Assente") return Colors.red;
    if (stato == "Ritardo") return Colors.orange;

    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Presenze"),
      ),

      body: ListView.builder(

        itemCount: widget.docenti.length,

        itemBuilder: (c, i) {

          final d = widget.docenti[i];

          return Card(

            child: Padding(

              padding: const EdgeInsets.all(10),

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Row(

                    children: [

                      CircleAvatar(
                        backgroundColor: colore(d.stato),
                        radius: 8,
                      ),

                      const SizedBox(width: 10),

                      Text(
                        "${d.nome} ${d.cognome}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  DropdownButton<String>(

                    value: d.stato,

                    isExpanded: true,

                    items: stati.map((s) {

                      return DropdownMenuItem(
                        value: s,
                        child: Text(s),
                      );
                    }).toList(),

                    onChanged: (val) {

                      setState(() {

                        d.stato = val!;

                        if (val == "Assente") {
                          d.assenze++;
                        }

                        if (val == "Ritardo") {
                          d.ritardi++;
                        }
                      });
                    },
                  ),

                  const SizedBox(height: 10),

                  DropdownButton<String>(

                    value: d.motivazione,

                    isExpanded: true,

                    hint: const Text("Motivazione"),

                    items: motivi.map((m) {

                      return DropdownMenuItem(
                        value: m,
                        child: Text(
                          m.isEmpty ? "Nessuna motivazione" : m,
                        ),
                      );
                    }).toList(),

                    onChanged: (val) {

                      setState(() {
                        d.motivazione = val!;
                      });
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