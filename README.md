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

lib/
│
├── core/                  # Common utilities
│   ├── error/
│   ├── utils/
│   └── network/
│
├── data/                  # Models, API, Repository
│   ├── datasources/
│   │   ├── dog_api_service.dart
│   │   └── os_info_channel.dart
│   ├── models/
│   │   ├── breed_model.dart
│   │   └── dog_image_model.dart
│   └── repositories/
│       └── dog_repository_impl.dart
│
├── domain/                
│   ├── entities/
│   │   └── breed.dart
│   ├── repositories/
│   │   └── dog_repository.dart
│   └── usecases/
│       ├── get_breeds_with_images.dart
│       ├── get_random_breed_image.dart
│       └── get_os_version.dart
│
├── presentation/
│   ├── blocs/
│   │   ├── dog/
│   │   │   ├── dog_bloc.dart
│   │   │   ├── dog_event.dart
│   │   │   └── dog_state.dart
│   │   └── settings/
│   │       ├── settings_bloc.dart
│   │       ├── settings_event.dart
│   │       └── settings_state.dart
│   ├── screens/
│   │    ├── splash_screen.dart
│   │    ├── home_screen.dart
│   │    ├── settings_screen.dart
│   │    └── widgets/
│   │        ├── breed_bottom_sheet.dart
│   │        ├── breed_card.dart
│   │        └── breed_grid_item.dart
│   │ 
│   └── app.dart
│
├── config/               
│
└── main.dart
