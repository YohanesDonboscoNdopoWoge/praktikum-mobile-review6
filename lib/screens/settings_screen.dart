import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkModeActive = false;

  void changeTheme(bool value) {
    setState(() {
      isDarkModeActive = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(
              isDarkModeActive ? Icons.dark_mode : Icons.light_mode,
            ),
            title: Text("Title"),
            trailing: Switch(
              value: isDarkModeActive,
              onChanged: (bool value) {
                changeTheme(value);
              },
            ),
            onTap: () {
              changeTheme(!isDarkModeActive);
            },
          )
        ],
      ),
    );
  }
}