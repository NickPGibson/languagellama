

import 'package:languagellama/repository/pack.dart';

class Repository {


  List<Pack> getPacks() {
    return [
      Pack(name: "Verbs", words: _verbs),
      Pack(name: "Animals", words: _animals),
     // Pack(name: "Kitchen"),
    //  Pack(name: "Sports"),
    ];
  }

  static const Map<String, String> _verbs = {
    "start": "empezar",
    "eat": "comer",
    "swim": "nadar",
    "sleep": "dormir",
    "run": "correr",
    "go": "ir",
    "finish": "terminar",
    "stay": "quedarse",
    "write": "escribir",
    "live": "vivir",
    "cry": "llorar",
  };

  static const Map<String, String> _animals = {
    "cat": "gato",
    "dog": "perro",
    "horse": "caballo",
    "bird": "pajaro",
    "pig": "cerdo",
    "cow": "vaca",
    "bull": "toro",
    "fish": "pez",
    "rabbit": "conejo",
    "sheep": "oveja",
    "goat": "cabra",
    "owl": "búho",
    "bear": "oso",
    "wolf": "lobo"
  };

  Map<String, String> getLanguagePairs() {
    return {
      "hello": "hola",
      "dog": "perro",
      "cat": "gato",
      "woman": "mujer",
      "look": "mirar",
      "eat": "comer",
      "start": "empezar",
      "wolf": "lobo",
      "war": "guerra",
      "swim": "nadar",
      "card": "tarjeta",
      "cash": "efectivo",
      "bed": "cama",
      "shoe": "zapato"
    };
  }
}

