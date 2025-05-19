# AppNation Mobile Developer Case Study

A simple Flutter app that lists dog breeds using the Dog API(https://dog.ceo/dog-api/). Built as part of a mobile developer intern case study.

## Features
- Splash screen that preloads all dog breeds and one image each.
- Home tab with searchable breed list and random image generator.
- Settings tab shows OS version via native MethodChannel.
- Clean Architecture + BLoC pattern.

## Architecture

- `domain`: business logic (entities, use cases)
- `data`: API & data sources
- `presentation`: UI & blocs
- State management with `flutter_bloc`
<img src="https://github.com/user-attachments/assets/95527f5c-802e-4287-bce3-b338526d1fb2" width="300" />
<img src="https://github.com/user-attachments/assets/8b3503b4-08a4-4daf-b309-6cba1edb8a94" width="300" />
<img src="https://github.com/user-attachments/assets/cc386a5a-a291-447c-9a77-50d9fc5f2f1e" width="300" />
<img src="https://github.com/user-attachments/assets/5cad536c-c66c-4990-9d0b-2dc3fdb464ee" width="300" />
