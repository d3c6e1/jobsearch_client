class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String username;

  User({this.id, this.email, this.firstName, this.lastName, this.username});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
    );
  }
}