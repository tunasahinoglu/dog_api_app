import 'package:flutter/material.dart';
import '../../../data/datasources/dog_api_service.dart';

class BreedBottomSheet extends StatefulWidget {
  final String breedName;

  const BreedBottomSheet({super.key, required this.breedName});

  @override
  State<BreedBottomSheet> createState() => _BreedBottomSheetState();
}

class _BreedBottomSheetState extends State<BreedBottomSheet> {
  String? imageUrl;
  bool isLoading = false;

  void fetchImage() async {
    setState(() => isLoading = true);
    try {
      final url = await DogApiService().getRandomImage(widget.breedName);
      setState(() => imageUrl = url);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Failed to fetch image.")));
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(widget.breedName, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            isLoading
                ? const CircularProgressIndicator()
                : imageUrl != null
                ? Image.network(imageUrl!)
                : const Text("No image yet."),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: fetchImage,
              child: const Text("Generate"),
            ),
          ],
        ),
      ),
    );
  }
}
