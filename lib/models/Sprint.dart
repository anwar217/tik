import 'package:suiviprojet/models/Tache.dart';

class Sprint {
  int id;
  String nom;
  DateTime datedebut;
  DateTime datefin;
  String description;
  String status;
  List<Tache> tasks;

  Sprint({
    required this.id,
    required this.nom,
    required this.datedebut,
    required this.datefin,
    required this.description,
    required this.status,
    required this.tasks,
  });

  factory Sprint.fromJson(Map<String, dynamic> json) {
    return Sprint(
      id: json['id'],
      nom: json['nom'],
      datedebut: DateTime.parse(json['datedebut']),
      datefin: DateTime.parse(json['datefin']),
      description: json['description'],
      status: json['status'],
      tasks: List<Tache>.from(json['tasks'].map((task) => Tache.fromJson(task))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'datedebut': datedebut.toIso8601String(),
      'datefin': datefin.toIso8601String(),
      'description': description,
      'status': status,
      'tasks': tasks.map((task) => task.toJson()).toList(),
    };
  }
}
