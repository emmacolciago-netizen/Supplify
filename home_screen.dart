import 'package:flutter/material.dart';
import '../models/docente.dart';
import '../models/classe.dart';
import 'docenti_screen.dart';
import 'classi_screen.dart';
import 'presenze_screen.dart';
import 'orario_screen.dart';
import 'resoconto_classi_screen.dart';
import '../screens/resoconto_screen.dart';
import 'orario_classi_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // prende i dati in memoria
  List<Docente> docenti = [];
  List<Classe> classi = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Gestione Scuola"),
      ),

      // menù laterale
      drawer: Drawer(

        child: ListView(

          padding: EdgeInsets.zero,

          children: [

            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Icon(Icons.school, size: 60, color: Colors.white),

                  SizedBox(height: 10),

                  Text(
                    "Registro Scolastico",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),

            // DOCENTI
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Docenti"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DocentiScreen(docenti: docenti),
                  ),
                );
              },
            ),

            // CLASSI
            ListTile(
              leading: const Icon(Icons.class_),
              title: const Text("Classi"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>  ClassiScreen(
                      classi: classi,
                    ),
                  ),
                );
              },
            ),

            // PRESENZE
            ListTile(
              leading: const Icon(Icons.check_circle),
              title: const Text("Presenze"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PresenzeScreen(docenti: docenti),
                  ),
                );
              },
            ),

            // ORARIO
            ListTile(
              leading: const Icon(Icons.schedule),
              title: const Text("Orario"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrarioScreen(
                      docenti: docenti,
                      classi: classi,
                    ),
                  ),
                );
              },
            ),

            // RESOCONTO CLASSI
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text("Resoconto Classi"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ResocontoClassiScreen(
                      docenti: docenti,
                      classi: classi,
                    ),
                  ),
                );
              },
            ),

            // RESOCONTO DOCENTI
            ListTile(
              leading: const Icon(Icons.analytics),
              title: const Text("Resoconto Docenti"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ResocontoDocentiScreen(
                      docenti: docenti,
                    ),
                  ),
                );
              },
            ),

            ListTile(

// orario classi
  leading: const Icon(Icons.calendar_month),

  title: const Text("Orario Classi"),

  onTap: () {

    Navigator.push(

      context,

      MaterialPageRoute(

        builder: (_) => OrarioClassiScreen(
          docenti: docenti,
          classi: classi,
        ),
      ),
    );
  },
),
          ],
        ),
      ),

      // HOME VISIVA
      body: const Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Icon(Icons.school, size: 120, color: Colors.blue),

            SizedBox(height: 20),

            Text(
              "Sistema gestione docenti",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}