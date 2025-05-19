import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/settings/settings_bloc.dart';
import '../blocs/settings/settings_event.dart';
import '../blocs/settings/settings_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsBloc()..add(LoadOSVersion()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Settings")),
        body: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            String version = '';
            if (state is SettingsLoaded) {
              version = state.osVersion;
            }

            return ListView(
              children: [
                const ListTile(
                  leading: Icon(Icons.help_outline),
                  title: Text("Help"),
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.star_border),
                  title: Text("Rate Us"),
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.share_outlined),
                  title: Text("Share with Friends"),
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.description_outlined),
                  title: Text("Terms of Use"),
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.privacy_tip_outlined),
                  title: Text("Privacy Policy"),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("OS Version"),
                      Text(
                        version.isEmpty ? "Loading..." : version,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
