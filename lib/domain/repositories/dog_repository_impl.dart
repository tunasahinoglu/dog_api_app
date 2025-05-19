import 'package:appnation/data/datasources/dog_api_service.dart';
import 'package:appnation/data/models/breed_model.dart';

import '../../domain/entities/breed.dart';
import '../../domain/repositories/dog_repository.dart';

class DogRepositoryImpl implements DogRepository {
  final DogApiService apiService;

  DogRepositoryImpl(this.apiService);

  @override
  Future<List<Breed>> getBreedsWithImages() async {
    final breedsMap = await apiService.getAllBreeds();
    final List<Breed> breeds = [];

    await Future.wait(
      breedsMap.keys.map((breedName) async {
        final imageUrl = await apiService.getRandomImage(breedName);
        breeds.add(BreedModel(name: breedName, imageUrl: imageUrl));
      }),
    );

    return breeds;
  }

  @override
  Future<String> getRandomImage(String breed) {
    return apiService.getRandomImage(breed);
  }
}
