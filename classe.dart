class Classe {

  int anno;
  String sezione;
  int alunni;

  Classe({
    required this.anno,
    required this.sezione,
    required this.alunni,
  });

  String get nome => "$anno$sezione";
}