import 'package:appnation/domain/usecases/get_breeds.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dog_event.dart';
import 'dog_state.dart';

class DogBloc extends Bloc<DogEvent, DogState> {
  final GetBreedsWithImages getBreedsWithImages;

  DogBloc({required this.getBreedsWithImages}) : super(DogInitial()) {
    on<LoadBreeds>((event, emit) async {
      emit(DogLoading());
      try {
        final breeds = await getBreedsWithImages();
        emit(DogLoaded(breeds));
      } catch (e) {
        emit(DogError('Error loading breeds: ${e.toString()}'));
      }
    });
  }
}
