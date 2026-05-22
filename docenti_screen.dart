import 'package:flutter/material.dart';

import '../models/docente.dart';
import '../screens/dettaglio_screen.dart';
// schermata per aggiungere i docenti
class DocentiScreen extends StatefulWidget {

  final List<Docente> docenti;

  const DocentiScreen({
    super.key,
    required this.docenti,
  });

  @override
  State<DocentiScreen> createState() => _DocentiScreenState();
}

class _DocentiScreenState extends State<DocentiScreen> {

  final nomeController = TextEditingController();
  final cognomeController = TextEditingController();
  final materiaController = TextEditingController();
  final emailController = TextEditingController();
  final telefonoController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Docenti"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(12),

        child: Column(

          children: [

            // nome
            TextField(

              controller: nomeController,

              decoration: InputDecoration(

                hintText: "Nome",

                filled: true,
                fillColor: Colors.grey.shade200,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // cognome
            TextField(

              controller: cognomeController,

              decoration: InputDecoration(

                hintText: "Cognome",

                filled: true,
                fillColor: Colors.grey.shade200,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // materia
            TextField(

              controller: materiaController,

              decoration: InputDecoration(

                hintText: "Materia",

                filled: true,
                fillColor: Colors.grey.shade200,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // email
            TextField(

              controller: emailController,

              decoration: InputDecoration(

                hintText: "Email",

                filled: true,
                fillColor: Colors.grey.shade200,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // numero di telefono
            TextField(

              controller: telefonoController,

              decoration: InputDecoration(

                hintText: "Telefono",

                filled: true,
                fillColor: Colors.grey.shade200,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // tasto per aggiungere
            SizedBox(

              width: double.infinity,

              child: ElevatedButton(

                onPressed: () {

                  if (nomeController.text.isEmpty ||
                      cognomeController.text.isEmpty) {
                    return;
                  }

                  setState(() {

                    widget.docenti.add(

                      Docente(

                        nome: nomeController.text,
                        cognome: cognomeController.text,
                        materia: materiaController.text,
                        email: emailController.text,
                        telefono: telefonoController.text,
                      ),
                    );
                  });

                  nomeController.clear();
                  cognomeController.clear();
                  materiaController.clear();
                  emailController.clear();
                  telefonoController.clear();
                },

                child: const Text("Aggiungi Docente"),
              ),
            ),

            const SizedBox(height: 15),

            // lista con docenti inseriti
            Expanded(

              child: ListView.builder(

                itemCount: widget.docenti.length,

                itemBuilder: (c, i) {

                  final d = widget.docenti[i];

                  return Card(

                    child: ListTile(

                      leading: const Icon(Icons.person),

                      title: Text("${d.nome} ${d.cognome}"),

                      subtitle: Text(d.materia),

                      // dettagli
                      onTap: () {

                        Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder: (_) => DocenteDetailScreen(
                              docente: d,
                            ),
                          ),
                        );
                      },

                      // tasto per eliminare i docenti
                      trailing: IconButton(

                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),

                        onPressed: () {

                          setState(() {

                            widget.docenti.removeAt(i);
                          });
                        },
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