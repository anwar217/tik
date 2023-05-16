class Membre {
  int id;
  String firstName;
  String lastName;
  String image;
  String email;

  Membre({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.email,
  });

  factory Membre.fromJson(Map<String, dynamic> json) {
    return Membre(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      image: json['image'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'image': image,
      'email': email,
    };
  }
}
