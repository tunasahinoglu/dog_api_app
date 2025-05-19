import 'package:flutter/material.dart';
import '../../../domain/entities/breed.dart';
import 'breed_bottom_sheet.dart';

class BreedCard extends StatelessWidget {
  final Breed breed;

  const BreedCard({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(breed.imageUrl),
      ),
      title: Text(breed.name),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) => BreedBottomSheet(breedName: breed.name),
        );
      },
    );
  }
}
