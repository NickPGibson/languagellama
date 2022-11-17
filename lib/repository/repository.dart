

import 'package:languagellama/repository/pack.dart';
import 'package:languagellama/repository/pack_content.dart';

class Repository {

  List<Pack> getPacks() {
    return [
      Pack(name: "Verbs", id: _verbsId),
      Pack(name: "Animals", id: _animalsId),
     // Pack(name: "Kitchen"),
    //  Pack(name: "Sports"),
    ];
  }

  static const _verbsId = "47d4f829-e732-4e20-939c-fd75e08ca5b9";
  static const _animalsId = "ec32d823-cd52-483f-95b9-38e923fb7e66";

  WordPackContent getWordPackContent(String id) {
    if (id == _verbsId) {
      return WordPackContent(words: _verbs);
    } else if (id == _animalsId) {
      return WordPackContent(words: _animals);
    } else {
      throw Exception("Invalid pack id $id");
    }
  }

  int? getHighScore({required String id}) {
    // todo
  }

  void setHighScore({required String id, required int highScore}) {
    // todo
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
}
