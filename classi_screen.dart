import 'package:flutter/material.dart';
import '../models/classe.dart';

class ClassiScreen extends StatefulWidget {

  final List<Classe> classi;

  const ClassiScreen({
    super.key,
    required this.classi,
  });

  @override
  State<ClassiScreen> createState() => _ClassiScreenState();
}

class _ClassiScreenState extends State<ClassiScreen> {

  final anno = TextEditingController();
  final sezione = TextEditingController();
  final alunni = TextEditingController();

  void aggiungi() {

    if (anno.text.isEmpty ||
        sezione.text.isEmpty ||
        alunni.text.isEmpty) {
      return;
    }

    setState(() {

      widget.classi.add(

        Classe(

          anno: int.parse(anno.text),
          sezione: sezione.text,
          alunni: int.parse(alunni.text),
        ),
      );
    });

    anno.clear();
    sezione.clear();
    alunni.clear();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Classi"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(12),

        child: Column(

          children: [

            // anno
            TextField(

              controller: anno,

              keyboardType: TextInputType.number,

              decoration: InputDecoration(

                hintText: "Anno (1-5)",

                filled: true,
                fillColor: Colors.grey.shade200,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // sezione
            TextField(

              controller: sezione,

              decoration: InputDecoration(

                hintText: "Sezione",

                filled: true,
                fillColor: Colors.grey.shade200,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // il numero di alunni
            TextField(

              controller: alunni,

              keyboardType: TextInputType.number,

              decoration: InputDecoration(

                hintText: "Numero Alunni",

                filled: true,
                fillColor: Colors.grey.shade200,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // tasto per aggiungere classi
            SizedBox(

              width: double.infinity,

              child: ElevatedButton(

                onPressed: aggiungi,

                child: const Text("Aggiungi Classe"),
              ),
            ),

            const SizedBox(height: 15),

            // lista dove compaiono tutte le classi
            Expanded(

              child: ListView.builder(

                itemCount: widget.classi.length,

                itemBuilder: (c, i) {

                  final cl = widget.classi[i];

                  return Card(

                    child: ListTile(

                      leading: const Icon(Icons.class_),

                      title: Text(cl.nome),

                      subtitle: Text(
                        "Alunni: ${cl.alunni}",
                      ),

                      // tasto per rimuovere le classi
                      trailing: IconButton(

                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),

                        onPressed: () {

                          setState(() {

                            widget.classi.removeAt(i);
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