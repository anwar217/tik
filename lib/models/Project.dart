import 'dart:convert';
import 'package:suiviprojet/models/Membre.dart';
import 'package:suiviprojet/models/Sprint.dart';
import 'package:suiviprojet/models/Tache.dart';

class Project {
  int id;
  String name;
  String description;
  DateTime createdAt;
  List<Sprint> sprints;
  List<Membre> members;
  List<Tache> tasks;

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.sprints,
    required this.members,
    required this.tasks,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    List<dynamic> sprintsJson = json['sprints'];
    List<dynamic> membersJson = json['members'];
    List<dynamic> tasksJson = json['tasks'];

    List<Sprint> sprints = sprintsJson.map((sprint) => Sprint.fromJson(sprint)).toList();
    List<Membre> members = membersJson.map((member) => Membre.fromJson(member)).toList();
    List<Tache> tasks = tasksJson.map((task) => Tache.fromJson(task)).toList();

    return Project(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      createdAt:json['createdAt'],
      sprints: sprints,
      members: members,
      tasks: tasks,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> sprintsJson = sprints.map((sprint) => sprint.toJson()).toList();
    List<Map<String, dynamic>> membersJson = members.map((member) => member.toJson()).toList();
    List<Map<String, dynamic>> tasksJson = tasks.map((task) => task.toJson()).toList();

    return {
      'name': name,
      'description': description,
      'sprints': sprintsJson,
      'members': membersJson,
      'tasks': tasksJson,
    };
  }
}
