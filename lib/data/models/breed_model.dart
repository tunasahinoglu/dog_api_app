import '../../domain/entities/breed.dart';

class BreedModel extends Breed {
  BreedModel({required super.name, required super.imageUrl});

  factory BreedModel.fromJson(String name, String imageUrl) {
    return BreedModel(name: name, imageUrl: imageUrl);
  }
}
