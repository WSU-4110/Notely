import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart'; //Flutter Settings Package
//Added under 'dependencies' in pubspec.yaml

List<Icon> icons = [
  Icon(Icons.person),
  Icon(Icons.settings),
  Icon(Icons.credit_card),
];

Size buttonSize;
Offset buttonPosition;
bool isMenuOpen = false;

abstract class Settings extends StatelessWidget {
  String tileName;
  bool value;

  bool getValue();
}

class SettingsBase extends Settings {
  SettingsBase(String tileName, bool value) {
    this.tileName = tileName;
    this.value = value;
  }

  @override
  bool getValue() {
    return value;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

abstract class SettingsDecorator extends Settings {
  final Settings setting;

  SettingsDecorator(this.setting);

  @override
  bool getValue() {
    return setting.getValue();
  }
}

class SettingsPage extends SettingsDecorator {
  SettingsPage(Settings setting) : super(setting) {
    tileName = "Accounts";
    value = false;
  }

  @override
  Widget build(BuildContext context) {
    bool privateAccountValue = value;

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
            title: tileName,
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
                onPressed: (BuildContext context) {
                  //Code to change email will go here.
                },
              ),
              SettingsTile(
                title: 'Change Major',
                leading: Icon(Icons.history_edu_outlined),
                onPressed: (BuildContext context) {
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
                  onPressed: (BuildContext context) {
                    Container(
                      height: icons.length * buttonSize.height,
                      decoration: BoxDecoration(
                        color: Color(0xFFF67C0B9),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Theme(
                        data: ThemeData(
                          iconTheme: IconThemeData(
                            color: Colors.white,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            icons.length,
                            (index) {
                              return GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: buttonSize.width,
                                  height: buttonSize.height,
                                  child: icons[index],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
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
                  onToggle: (bool toggle) {
                    //privateAccountValue is changed on user toggle. Important for later.
                    if (toggle) {
                      privateAccountValue = true;
                      leading:
                      Icon(Icons.ac_unit);
                    } else {
                      leading:
                      Icon(Icons.local_airport_sharp);
                      privateAccountValue = false;
                    }
                  },
                ),
              ])
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

/*
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool privateAccountValue = false;
    String dropdownValue = '';

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
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: 'Change Email',
                leading: Icon(Icons.email_outlined),
                onPressed: (BuildContext context) {
                  //Code to change email will go here.
                },
              ),
              SettingsTile(
                title: 'Change Major',
                leading: Icon(Icons.history_edu_outlined),
                onPressed: (BuildContext context) {
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
                  onPressed: (BuildContext context) {
                    Container(
                      height: icons.length * buttonSize.height,
                      decoration: BoxDecoration(
                        color: Color(0xFFF67C0B9),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Theme(
                        data: ThemeData(
                          iconTheme: IconThemeData(
                            color: Colors.white,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            icons.length,
                            (index) {
                              return GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: buttonSize.width,
                                  height: buttonSize.height,
                                  child: icons[index],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
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
                  onToggle: (bool toggle) {
                    //privateAccountValue is changed on user toggle. Important for later.
                    if (toggle) {
                      privateAccountValue = true;
                      leading:
                      Icon(Icons.ac_unit);
                    } else {
                      leading:
                      Icon(Icons.local_airport_sharp);
                      privateAccountValue = false;
                    }
                  },
                ),
              ])
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

  void setState(Null Function() param0) {} // For future functionality
}
*/
