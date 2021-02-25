import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart'; //Flutter Settings Package
//Added under 'dependencies' in pubspec.yaml

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool value = true; //Some bool variable we might need.. Dark Mode??

    return new SettingsList(
      sections: [
        SettingsSection(
          title: 'Settings',
          tiles: [
            SettingsTile(
              title: 'Language',
              subtitle: 'English',
              leading: Icon(Icons.language),
              onPressed: (BuildContext context) {},
            ),
            SettingsTile.switchTile(
              title: 'Use fingerprint',
              leading: Icon(Icons.fingerprint),
              switchValue: value,
              onToggle: (bool value) {},
            ),
            SettingsTile(
              title: 'Back',
              leading: Icon(Icons.arrow_back_ios),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ],
    );
  }
}
