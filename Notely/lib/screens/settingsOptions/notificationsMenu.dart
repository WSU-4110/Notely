import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Option {
  Icon icon;
  String title;
  String subtitle;

  Option({this.icon, this.title, this.subtitle});
}

final options = [
  Option(
    icon: Icon(Icons.notification_important, size: 40.0),
    title: 'Every Post',
    subtitle: 'Receive a phone/email notification every post. ',
  ),
  Option(
    icon: Icon(Icons.notification_important_outlined, size: 40.0),
    title: 'Every Other Post',
    subtitle: 'Receive a phone/email notification every other post. ',
  ),
  Option(
    icon: Icon(Icons.notification_important_rounded, size: 40.0),
    title: 'Every 5 Posts',
    subtitle: 'Receive a phone/email notification every five posts. ',
  ),
  Option(
    icon: Icon(Icons.notification_important_sharp, size: 40.0),
    title: 'Every 10 Posts',
    subtitle: 'Receive a phone/email notification every 10 posts. ',
  ),
  Option(
    icon: Icon(Icons.notification_important_sharp, size: 40.0),
    title: 'Off',
    subtitle:
        'Turn off your notifications so you will not get notified when there is a post.',
  ),
];

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  int _selectedOption = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        appBar: AppBar(
          backgroundColor: Colors.tealAccent.shade700,
          title: Text('Menu Options'),
          leading: FlatButton(
            textColor: Colors.white,
            child: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            FlatButton(
              textColor: Colors.white,
              child: Text(
                'HELP',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {},
            )
          ],
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
                border: _selectedOption == index - 1
                    ? Border.all(color: Colors.black26)
                    : null,
              ),
              child: ListTile(
                leading: options[index - 1].icon,
                title: Text(
                  options[index - 1].title,
                  style: TextStyle(
                    color: _selectedOption == index - 1
                        ? Colors.black
                        : Colors.grey[600],
                  ),
                ),
                subtitle: Text(
                  options[index - 1].subtitle,
                  style: TextStyle(
                    color: _selectedOption == index - 1
                        ? Colors.black
                        : Colors.grey,
                  ),
                ),
                selected: _selectedOption == index - 1,
                onTap: () {
                  setState(() {
                    _selectedOption = index - 1;
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
            color: Color(0xFFF3F3F3),
            child: Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'SAVE & CONTINUE',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 18.0,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
