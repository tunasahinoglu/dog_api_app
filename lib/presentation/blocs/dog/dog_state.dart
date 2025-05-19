import '../../../domain/entities/breed.dart';

abstract class DogState {}

class DogInitial extends DogState {}

class DogLoading extends DogState {}

class DogLoaded extends DogState {
  final List<Breed> breeds;
  DogLoaded(this.breeds);
}

class DogError extends DogState {
  final String message;
  DogError(this.message);
}
