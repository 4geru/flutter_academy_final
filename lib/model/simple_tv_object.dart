import 'dart:convert';

class SimpleTvObject {
  SimpleTvObject(
      {required this.id,
      required this.originalName,
      required this.posterPath,
      required this.timestamp});

  factory SimpleTvObject.fromString(String str) {
    final Map<String, dynamic> json = jsonDecode(str);
    return SimpleTvObject(
        id: json['id'],
        originalName: json['originalName'],
        posterPath: json['posterPath'],
        timestamp: DateTime.parse(json['timestamp']));
  }
  int id;
  String originalName;
  String posterPath;
  DateTime timestamp;

  @override
  String toString() {
    return jsonEncode({
      'id': id,
      'originalName': originalName,
      'posterPath': posterPath,
      'timestamp': timestamp.toString(),
    });
  }
}
