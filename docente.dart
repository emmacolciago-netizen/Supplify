import 'classe.dart';

class Docente {

  String nome;
  String cognome;
  String materia;
  String email;
  String telefono;

  String stato;
  String motivazione;

  int assenze;
  int ritardi;

  // definisce l'orario
  List<String> statoOre;

  // definisce la classe
  List<Classe?> classiOre;

  Docente({

    required this.nome,
    required this.cognome,
    required this.materia,
    required this.email,
    required this.telefono,

    this.stato = "Presente",
    this.motivazione = "",

    this.assenze = 0,
    this.ritardi = 0,

    List<String>? statoOre,
    List<Classe?>? classiOre,

  }) : statoOre = statoOre ?? List.filled(6, "Disponibile Supplenza"),
       classiOre = classiOre ?? List.filled(6, null);
}