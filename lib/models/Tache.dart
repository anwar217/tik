import 'package:suiviprojet/models/Membre.dart';

class Tache {
  Membre? membre;
  String title;
  String description;

  Tache({
    this.membre,
    required this.title,
    required this.description,
  });

  factory Tache.fromJson(Map<String, dynamic> json) {
    Membre? membre = json['membre'] != null ? Membre.fromJson(json['membre']) : null;

    return Tache(
      membre: membre,
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'membre': membre != null ? membre!.toJson() : null,
      'title': title,
      'description': description,
    };
  }
}
