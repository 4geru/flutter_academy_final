
import 'dart:convert';

class SimpleTvObject {
  int id;
  String originalName;
  String posterPath;
  SimpleTvObject({
    required this.id,
    required this.originalName,
    required this.posterPath,
  });

  factory SimpleTvObject.fromString(String str) {
    Map<String, dynamic> json = jsonDecode(str);
    return SimpleTvObject(
      id: json['id'],
      originalName: json['originalName'],
      posterPath: json['posterPath'],
    );
  }

  String toString() {
    return jsonEncode({
      'id': id,
      'originalName': originalName,
      'posterPath': posterPath
    });
  }
}
