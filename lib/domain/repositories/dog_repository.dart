import '../entities/breed.dart';

abstract class DogRepository {
  Future<List<Breed>> getBreedsWithImages();
  Future<String> getRandomImage(String breed);
}
