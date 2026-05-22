import 'package:flutter/material.dart';
import '../models/docente.dart';

class SupplenzeScreen extends StatelessWidget {

  final List<Docente> docenti;

  const SupplenzeScreen({super.key, required this.docenti});

  Docente? trovaSupplente() {

    for (var d in docenti) {

      if (d.stato == "Presente") {
        return d;
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {

    final supplente = trovaSupplente();

    return Scaffold(

      appBar: AppBar(title: const Text("Supplenze")),

      body: Column(

        children: [

          const SizedBox(height: 20),

          Text(
            supplente != null
                ? "Supplente disponibile: ${supplente.nome}"
                : "Nessun supplente disponibile",
          ),

          const SizedBox(height: 20),

          Expanded(

            child: ListView.builder(

              itemCount: docenti.length,

              itemBuilder: (c, i) {

                final d = docenti[i];

                return ListTile(
                  title: Text("${d.nome} ${d.cognome}"),
                  subtitle: Text(d.stato),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
} 