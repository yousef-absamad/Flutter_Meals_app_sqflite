class MealModel {
  final int? id;
  final String name;
  final String imageUrl;
  final String description;
  final String time;
  final double rate;

  MealModel({
    this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.time,
    required this.rate,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
      'time': time,
      'rate': rate,
    };
  }

  factory MealModel.fromeMap(Map<String, dynamic> map) {
    return MealModel(
      id: map['id'],
      name: map['name'],
      imageUrl: map['imageUrl'],
      description: map['description'],
      time: map['time'],
      rate: map['rate'] is int ? (map['rate'] as int).toDouble() : map['rate'],
    );
  }
}
