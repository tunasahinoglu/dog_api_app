import 'package:appnation/domain/repositories/dog_repository_impl.dart';
import 'package:appnation/domain/usecases/get_breeds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/datasources/dog_api_service.dart';
import 'presentation/app.dart';
import 'presentation/blocs/dog/dog_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<DogBloc>(
          create: (_) => DogBloc(
            getBreedsWithImages: GetBreedsWithImages(
              DogRepositoryImpl(DogApiService()),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
