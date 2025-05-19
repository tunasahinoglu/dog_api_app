import 'package:appnation/presentation/blocs/dog/dog_bloc.dart';
import 'package:appnation/presentation/blocs/dog/dog_event.dart';
import 'package:appnation/presentation/blocs/dog/dog_state.dart';
import 'package:appnation/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<DogBloc>().add(LoadBreeds());

    return const SplashContent();
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<DogBloc, DogState>(
          listener: (context, state) {
            if (state is DogLoaded) { // checks if breeds are fetched from the api
              Navigator.pushReplacement( // when the breeds are fetched, navigates to the main screen
                context,
                MaterialPageRoute(builder: (_) => const MainScreen()),
              );
            }
          },
          builder: (context, state) {
            if (state is DogLoading) {
              return Text("Splash");
            } else if (state is DogError) {
              return Text(state.message);
            }
            return const Text('Loading...');
          },
        ),
      ),
    );
  }
}
