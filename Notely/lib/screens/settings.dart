import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart'; //Flutter Settings Package
//Added under 'dependencies' in pubspec.yaml

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool privateAccountValue = false;
    String dropdownValue = '';

    // "SettingsList" is from the package that I imported.
    return new SettingsList(
      sections: [
        // Different setting section, titled 'account'
        SettingsSection(
          title: 'Account',
          titlePadding: EdgeInsets.all(15),
          tiles: [
            // Individual tiles
            SettingsTile(
              title: 'Language',
              subtitle: 'English',
              leading: Icon(Icons.language),
              onPressed: (BuildContext context) {},
            ),
            SettingsTile(
              title: 'Change Email',
              leading: Icon(Icons.email_outlined),
              onTap: () {
                //Code to change email will go here.
              },
            ),
            SettingsTile(
              title: 'Change Major',
              leading: Icon(Icons.history_edu_outlined),
              onTap: () {
                //Code to change major wll go here.
              },
            )
          ],
        ),

        //Another section
        SettingsSection(
          title: 'Notifications',
          titlePadding: EdgeInsets.all(15),
          tiles: [
            SettingsTile(
                //Individual tiles
                title: 'Change Alert',
                leading: Icon(Icons.notifications),
                //tried to code this to pull out a drop down, doesn't work
                onTap: () {
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  );
                }),
          ],
        ),

        SettingsSection(
            title: 'Privacy',
            titlePadding: EdgeInsets.all(15),
            tiles: [
              SettingsTile.switchTile(
                title: 'Private Account',
                leading: Icon(Icons.lock),
                switchValue: privateAccountValue,
                onToggle: (bool value) {},
              ),
              SettingsTile(
                title: 'Back',
                leading: Icon(Icons.arrow_back_ios),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ])
      ],
    );
  }

  void setState(Null Function() param0) {} // For future functionality
}
