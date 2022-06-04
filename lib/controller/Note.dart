// ignore_for_file: file_names

class Note {
  final int? id;
  final String username;
  final String email;
  const Note({
    this.id,
    required this.username,
    required this.email,
  });

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json['id'],
        username: json['username'],
        email: json['email'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'email': email,
      };
}
