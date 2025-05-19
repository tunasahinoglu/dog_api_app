import 'package:appnation/data/datasources/os_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final OSInfoChannel _channel = OSInfoChannel();

  SettingsBloc() : super(SettingsInitial()) {
    on<LoadOSVersion>((event, emit) async {
      emit(SettingsLoading());
      final version = await _channel.getOSVersion();
      emit(SettingsLoaded(version));
    });
  }
}
