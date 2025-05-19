import 'package:appnation/presentation/blocs/dog/dog_bloc.dart';
import 'package:appnation/presentation/blocs/dog/dog_state.dart';
import 'package:appnation/presentation/screens/widgets/breed_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dog Breeds")),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<DogBloc, DogState>(
              builder: (context, state) {
                if (state is DogLoaded) {
                  final filtered =
                      state.breeds
                          .where(
                            (breed) => breed.name.toLowerCase().contains(query),
                          )
                          .toList();

                  if (filtered.isEmpty) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "No results found",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Try searching with another word",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    );
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final breed = filtered[index];
                      return BreedGridItem(breed: breed);
                    },
                  );
                } else if (state is DogLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is DogError) {
                  return Center(child: Text(state.message));
                }
                return const Center(child: Text("No data."));
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                contentPadding: const EdgeInsets.all(15),
              ),
              onChanged: (val) {
                setState(() {
                  query = val.toLowerCase();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
