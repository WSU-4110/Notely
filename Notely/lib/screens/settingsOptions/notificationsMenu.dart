import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//class for all of the change notification objects.
class Option {
  Icon icon;
  String title;
  String subtitle;

  Option({this.icon, this.title, this.subtitle});
}

//Array to hold all of the change notification options
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

//Stateful widget
class _NotificationsPageState extends State<NotificationsPage> {
  int optionIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //creates the top menu bar
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.tealAccent.shade400,
          elevation: 0.0,
          title: Text('Notification Options'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            //back button on top menu bar.
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        //creates the list.
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
              //For the individual tiles.
              child: ListTile(
                leading: options[index - 1].icon,
                title: Text(
                  //getting title of the object using the class.
                  options[index - 1].title,
                  style: TextStyle(
                    color: optionIndex == index - 1
                        ? Colors.black
                        : Colors.grey[600],
                  ),
                ),
                //settings the subtitle.
                subtitle: Text(
                  options[index - 1].subtitle,
                  style: TextStyle(
                    color:
                        optionIndex == index - 1 ? Colors.black : Colors.grey,
                  ),
                ),
                //Sets the selected option
                selected: optionIndex == index - 1,
                onTap: () {
                  setState(() {
                    optionIndex = index - 1;
                  });
                },
              ),
            );
          },
        ),
        //For the save and continue button:
        //creates bottom bar and programs the option to save.
        bottomSheet: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: double.infinity,
            height: 80.0,
            color: Colors.tealAccent.shade400,
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
