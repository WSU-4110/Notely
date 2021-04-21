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

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Page'),
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
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
                onPressed: (context) {},
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
                  //tried to code this to pull out a drop down, doesn't work
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
      //Here: I'm trying to display the profile picture above the settings page. Still working...
      persistentFooterButtons: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              border: Border.all(
                  width: 4, color: Theme.of(context).scaffoldBackgroundColor),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 10))
              ],
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://cdn2.iconfinder.com/data/icons/facebook-51/32/FACEBOOK_LINE-01-512.png",
                  ))),
        )
      ],
    );
  }
}
