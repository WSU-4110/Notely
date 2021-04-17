import 'package:Notely/screens/settingsOptions/change_language.dart';
import 'package:Notely/screens/settingsOptions/editprofile.dart';
import 'package:Notely/screens/settingsOptions/notificationsMenu.dart';
import 'package:Notely/screens/settingsOptions/privacy.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart'; //Flutter Settings Package
//Added under 'dependencies' in pubspec.yaml

openSettings(context) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              SettingsPage())); // Navigator to switch the user to Favorites Page screen
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

//Stateful widget
class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //This is the top bar
      appBar: AppBar(
        title: Text('Settings Page'),
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            //back button on the top bar.
            Navigator.pop(context);
          },
        ),
      ),
      body: SettingsList(
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
                onPressed: (context) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LanguagePage()));
                },
              ),
              SettingsTile(
                title: 'Edit Profile',
                subtitle: 'Change email, name, major, etc.',
                leading: Icon(Icons.edit),
                onPressed: (context) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()));
                },
              ),
            ],
          ),
          SettingsSection(
            title: 'Privacy',
            titlePadding: EdgeInsets.all(15),
            tiles: [
              //Privacy tile that will take you privacy settings page.
              //Users will have the option to make their acocunt public or private.
              SettingsTile(
                  title: 'Private Account',
                  leading: Icon(Icons.lock),
                  onPressed: (context) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PrivacyPage()));
                  })
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
                  //takes user to the change notifications page.
                  onPressed: (context) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationsPage()));
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
