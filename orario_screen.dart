import 'package:flutter/material.dart';
import '../models/docente.dart';
import '../models/classe.dart';

class OrarioScreen extends StatefulWidget {

  final List<Docente> docenti;
  final List<Classe> classi;

  const OrarioScreen({
    super.key,
    required this.docenti,
    required this.classi,
  });

  @override
  State<OrarioScreen> createState() => _OrarioScreenState();
}

class _OrarioScreenState extends State<OrarioScreen> {

  Docente? selezionato;

  final stati = [
    "In Classe",
    "Disponibile Supplenza",
    "Non a Scuola",
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Orario Docenti"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(12),

        child: Column(

          children: [

            DropdownButton<Docente>(

              value: selezionato,

              isExpanded: true,

              hint: const Text("Seleziona docente"),

              items: widget.docenti.map((d) {

                return DropdownMenuItem(
                  value: d,
                  child: Text("${d.nome} ${d.cognome}"),
                );
              }).toList(),

              onChanged: (v) {

                setState(() {
                  selezionato = v;
                });
              },
            ),

            const SizedBox(height: 15),

            if (selezionato != null)

              Expanded(

                child: ListView.builder(

                  itemCount: 6,

                  itemBuilder: (c, i) {

                    return Card(

                      child: Padding(

                        padding: const EdgeInsets.all(10),

                        child: Column(

                          children: [

                            Text(
                              "Ora ${i + 1}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 10),

                            // stato ora
                            DropdownButton<String>(

                              value: selezionato!.statoOre[i],

                              isExpanded: true,

                              items: stati.map((s) {

                                return DropdownMenuItem(
                                  value: s,
                                  child: Text(s),
                                );
                              }).toList(),

                              onChanged: (val) {

                                setState(() {

                                  selezionato!.statoOre[i] = val!;
                                });
                              },
                            ),

                            const SizedBox(height: 10),

                            // scelta della classe
                            if (selezionato!.statoOre[i] == "In Classe")

                              DropdownButton<Classe>(

                                value: selezionato!.classiOre[i],

                                isExpanded: true,

                                hint: const Text("Seleziona classe"),

                                items: widget.classi.map((cl) {

                                  return DropdownMenuItem(
                                    value: cl,
                                    child: Text(cl.nome),
                                  );
                                }).toList(),

                                onChanged: (val) {

                                  setState(() {

                                    selezionato!.classiOre[i] = val;
                                  });
                                },
                              ),
                          ],
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