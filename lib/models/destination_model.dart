import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  final String name;
  final String location;
  final String imageUrl;
  final String id;
  final double rating;
  final int price;

  DestinationModel({
    this.name = '',
    this.location = '',
    this.imageUrl = '',
    required this.id,
    this.rating = 0.0,
    this.price = 0,
  });

  factory DestinationModel.fromMap(String id, Map<String, dynamic> map) {
    return DestinationModel(
      id: id,
      name: map['name'],
      location: map['location'],
      imageUrl: map['imageUrl'],
      rating: double.parse('${map['rating']}'),
      price: map['price'],
    );
  }

  @override
  List<Object> get props {
    return [
      name,
      location,
      imageUrl,
      id,
      rating,
      price,
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'imageUrl': imageUrl,
      'id': id,
      'rating': rating,
      'price': price,
    };
  }
}
