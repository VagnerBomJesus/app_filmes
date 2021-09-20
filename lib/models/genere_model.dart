import 'dart:convert';

class GenereModel {
  final int id;
  final String name;

  GenereModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory GenereModel.fromMap(Map<String, dynamic> map) {
    return GenereModel(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GenereModel.fromJson(String source) =>
      GenereModel.fromMap(json.decode(source));
}
