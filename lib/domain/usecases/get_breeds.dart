import '../entities/breed.dart';
import '../repositories/dog_repository.dart';

class GetBreedsWithImages {
  final DogRepository repository;

  GetBreedsWithImages(this.repository);

  Future<List<Breed>> call() async {
    return await repository.getBreedsWithImages();
  }
}
