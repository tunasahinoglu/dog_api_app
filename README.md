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
