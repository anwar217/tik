class Membre {
  String firstName;
  String lastName;
  String image;
  String email;

  Membre({
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.email,
  });

  factory Membre.fromJson(Map<String, dynamic> json) {
    return Membre(
      firstName: json['firstName'],
      lastName: json['lastName'],
      image: json['image'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'image': image,
      'email': email,
    };
  }
}
