import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Option {
  Icon icon;
  String title;
  String subtitle;

  Option({this.icon, this.title, this.subtitle});
}

final options = [
  Option(
    icon: Icon(Icons.notification_important, size: 40.0),
    title: 'Public Account',
    subtitle:
        'Anonymous user: Name cannot be searched for. Posts are anonymous.',
  ),
  Option(
    icon: Icon(Icons.notification_important_outlined, size: 40.0),
    title: 'Private Account',
    subtitle:
        'People can search your name and see your posts. Your posts will have your username on them. ',
  ),
];

class PrivacyPage extends StatefulWidget {
  @override
  _PrivacyPageState createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  int optionIndex = 0;
  bool private = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.tealAccent.shade700,
          title: Text('Menu Options'),
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
        body: ListView.builder(
          itemCount: options.length + 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return SizedBox(height: 15.0);
            } else if (index == options.length + 1) {
              return SizedBox(height: 100.0);
            }
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10.0),
              width: double.infinity,
              height: 80.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: optionIndex == index - 1
                    ? Border.all(color: Colors.black26)
                    : null,
              ),
              child: ListTile(
                leading: options[index - 1].icon,
                title: Text(
                  options[index - 1].title,
                  style: TextStyle(
                    color: optionIndex == index - 1
                        ? Colors.black
                        : Colors.grey[600],
                  ),
                ),
                subtitle: Text(
                  options[index - 1].subtitle,
                  style: TextStyle(
                    color:
                        optionIndex == index - 1 ? Colors.black : Colors.grey,
                  ),
                ),
                selected: optionIndex == index - 1,
                onTap: () {
                  setState(() {
                    optionIndex = index - 1;
                    if (optionIndex == 0) {
                      private = false;
                    } else {
                      private = true;
                    }
                  });
                },
              ),
            );
          },
        ),
        bottomSheet: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: double.infinity,
            height: 80.0,
            color: Colors.tealAccent.shade700,
            child: Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'SAVE & CONTINUE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 18.0,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
