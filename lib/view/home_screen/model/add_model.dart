class Note {
  final String id;
  final String dateTime;

  final String description;

  Note({required this.id, required this.dateTime, required this.description});

  Map<String, dynamic> toJson() => {
    'id': id,
    'dateTime': dateTime,

    'description': description,
  };

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    id: json['id'],
    dateTime: json['dateTime'],
    description: json['description'],
  );
}
