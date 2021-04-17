import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Local class to store the tiles.
class Option {
  Icon icon;
  String title;
  String subtitle;

  Option({this.icon, this.title, this.subtitle});
}

//array of the two different tiles. Just the interface.
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

//stateful widget
class _PrivacyPageState extends State<PrivacyPage> {
  int optionIndex = 0;
  //bool for private account
  bool private = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //Top bar with the back button.
        appBar: AppBar(
          backgroundColor: Colors.tealAccent.shade700,
          title: Text('Privacy Settings'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            //functionality to the back button.
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        //Build the list.
        body: ListView.builder(
          itemCount: options.length + 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return SizedBox(height: 15.0);
            } else if (index == options.length + 1) {
              return SizedBox(height: 100.0);
            }
            //container to store the tiles.
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
              //For tiles, index tracks where you are.
              child: ListTile(
                //sets icon.
                leading: options[index - 1].icon,
                title: Text(
                  //sets title.
                  options[index - 1].title,
                  style: TextStyle(
                    color: optionIndex == index - 1
                        ? Colors.black
                        : Colors.grey[600],
                  ),
                ),
                subtitle: Text(
                  //sets subtitle.
                  options[index - 1].subtitle,
                  style: TextStyle(
                    color:
                        optionIndex == index - 1 ? Colors.black : Colors.grey,
                  ),
                ),
                selected: optionIndex == index - 1,
                //based on the selection.
                onTap: () {
                  setState(() {
                    //Here, we set the bool based on user selection
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
        //Bottom bar. Code to finalize will be in here.
        bottomSheet: GestureDetector(
          onTap: () {
            //Code to save changes will go here:
            //Could be something like user.privateAccount = private;
            Navigator.pop(context);
          },
          //Decorating the save button.
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
