import 'package:suiviprojet/models/Tache.dart';

class Sprint {
  int id;
  String nom;
  DateTime dateDebut;
  DateTime dateFin;
  String description;
  String status;
  List<Tache> tasks;

  Sprint({
    required this.id,
    required this.nom,
    required this.dateDebut,
    required this.dateFin,
    required this.description,
    required this.status,
    required this.tasks,
  });

  factory Sprint.fromJson(Map<String, dynamic> json) {
    return Sprint(
      id: json['id'],
      nom: json['nom'],
      dateDebut: DateTime.parse(json['dateDebut']),
      dateFin: DateTime.parse(json['dateFin']),
      description: json['description'],
      status: json['status'],
      tasks: List<Tache>.from(json['tasks'].map((task) => Tache.fromJson(task))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'dateDebut': dateDebut.toIso8601String(),
      'dateFin': dateFin.toIso8601String(),
      'description': description,
      'status': status,
      'tasks': tasks.map((task) => task.toJson()).toList(),
    };
  }
}
