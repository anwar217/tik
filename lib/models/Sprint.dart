import 'package:suiviprojet/models/Tache.dart';

class Sprint {
  String nom;
  DateTime dateDebut;
  DateTime dateFin;
  String description;
  String status;
  List<Tache> tasks;

  Sprint({
    required this.nom,
    required this.dateDebut,
    required this.dateFin,
    required this.description,
    required this.status,
    required this.tasks,
  });

  factory Sprint.fromJson(Map<String, dynamic> json) {
    List<dynamic> tasksJson = json['tasks'];

    List<Tache> tasks = tasksJson.map((task) => Tache.fromJson(task)).toList();

    return Sprint(
      nom: json['nom'],
      dateDebut: DateTime.parse(json['datedebut']),
      dateFin: DateTime.parse(json['datefin']),
      description: json['description'],
      status: json['status'],
      tasks: tasks,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> tasksJson = tasks.map((task) => task.toJson()).toList();

    return {
      'nom': nom,
      'datedebut': dateDebut.toIso8601String(),
      'datefin': dateFin.toIso8601String(),
      'description': description,
      'status': status,
      'tasks': tasksJson,
    };
  }
}
