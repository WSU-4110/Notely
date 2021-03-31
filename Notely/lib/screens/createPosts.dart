import 'dart:io';
import 'package:Notely/models/user.dart';
import 'package:flutter/material.dart';
import 'package:Notely/services/database.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Notely/services/tagsManager.dart';

File imageToUpload;
User userInfo; //This really needs to be moved to inside the class so it can be used properly

//Function is used by the home screen to naviagte to the create a post screen
openCreatePost(context, File image) {
  imageToUpload = image;
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => CreatePost())); // Navigator to switch the user to Favorites Page screen
}

//Gets the user's information. This needs to be fixed
getUserInfo(User user) {
  DatabaseService(uid: user.uid).getUserData().then((value){
    userInfo = new User(username: value.data["name"], numberOfPosts: value.data["numberOfPosts"]);
  });
}

//Function is called when the "Create Post" button is clicked. All the data is given and the function calls the corresponding
//function from DatabaseService based on if more pictures were added to the post
createPost(BuildContext context, String postTitle, String uid, List<File> images, List<String> tags) async {
  if(images.length == 0){
    await DatabaseService().createPost(postTitle, imageToUpload, uid, tags);
  }else{
    await DatabaseService().createMultiplePicPost(postTitle, imageToUpload, uid, images, tags);
  }
}

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

  final _formKey = GlobalKey<FormState>();

  List<Widget> boxes = new List();
  List<File> images = new List();
  List<Widget> tagBoxes = new List();

  //Manager to keep a list of tags that will be used when uploading to database
  TagsManager tags = new TagsManager();

  String postTitle = '';
  String error = '';
  String tag = '';
  int itemCount;
  File _image;

  //A picture has been added to the post. This function adds the picture to the boxes list so its displayed on screen.
  void addPicToBoxes(){
    setState(() {
      boxes.insert(0,Card(
        child: InkWell(
          splashColor: Colors.tealAccent.shade400,
          onTap: () {_showPicker(context);},
          child: SizedBox (
            width: 100,
            height: 100,
            child: Image.file(_image),
          ),
        ),
      ));
    });
  }

  //Adds the inital box with the plus icon for adding more pics to the list so its not empty at first
  void addInitialBox(){
    setState(() {
      boxes.add(Card(
        child: InkWell(
          splashColor: Colors.tealAccent.shade400,
          onTap: () {_showPicker(context);},
          child: SizedBox (
            width: 100,
            height: 100,
            child: Icon(
              Icons.add,
            )
          ),
        ),
      ));
    });
  }

  //Function deletes the last tag in the list. If there are no more tags in the list, the delete button is deleted as well
  void deleteTagBox(){
    setState(() {
      tags.removeTag(tagBoxes.length - 2);
      tagBoxes.removeAt(tagBoxes.length - 2);
      if(tagBoxes.length == 1){
        tagBoxes.removeAt(0);
      }
    });
  }

  //Adds a new tag to the list. If the tag is the first one added, the delete button is also added
  void addTagBox(){
    setState(() {

      //Add tag to object which will be used in the database
      tags.addTag(tag);

      //Checks to see if this is the first tag created
      if(tagBoxes.length == 0){
        tagBoxes.add(
          Card(
            color: Colors.tealAccent.shade400,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(tag),
                  ), 
                ),
              ],
            ),
          ),
        );
        tagBoxes.add(
          Padding(
            padding: EdgeInsets.only(top: 4),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)), color: Colors.tealAccent.shade400),
              child: InkWell(
                onTap: () {
                  deleteTagBox();
                },
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Icon(
                    Icons.delete,
                  ),
                ),
              ),
            ),
          ),
        );
      }else if(tagBoxes.length >= 2){
        tagBoxes.insert(tagBoxes.length-1,
          Card(
            color: Colors.tealAccent.shade400,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(tag),
                  ), 
                ),
              ],
            ),
          ),
        );
      }
    });
  }

  //Flutter function used to assign the first box to the add picture section
  @override
  void initState() {
    super.initState();
    addInitialBox();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a new Post'),
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
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(5.0)),
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 10.0),),
                Container(
                  child: Image.file(imageToUpload, width: 100, height: 100,),
                ),
                Padding(padding: EdgeInsets.only(left: 10.0),),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                          decoration: const InputDecoration(
                          hintText: 'Title name',
                          labelText: 'Enter Post Title',
                        ),
                        validator: (val) => val.isEmpty ? 'Title' : null,
                        onChanged: (val) {
                          setState(() => {postTitle = val});
                        },
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 200,
                            child: TextFormField(
                                decoration: const InputDecoration(
                                hintText: 'Add tag',
                                labelText: 'Add a tag',
                              ),
                              validator: (val) => val.isEmpty ? 'Tag' : null,
                              onChanged: (val) {
                                setState(() => {tag = val});
                              },
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(left: 20),),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)), color: Colors.tealAccent.shade400),
                            child: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                addTagBox();
                              },
                            )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 10.0),),
              ],
              ),
            Padding(padding: EdgeInsets.only(top: 10),),
            Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              runSpacing: 10,
              children: tagBoxes,
            ),
            const Divider(
              height: 40,
              thickness: 2,
              indent: 10,
              endIndent: 10,
              color: Colors.tealAccent,
            ),
            Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              runSpacing: 10,
              children: boxes,
            ),
            const Divider(
              height: 40,
              thickness: 2,
              indent: 10,
              endIndent: 10,
              color: Colors.tealAccent,
            ),
            ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.tealAccent.shade400)),
                onPressed: () async {
                  //INSERT LOADING WIDGET HERE *********************************************************************************
                  await createPost(context, postTitle, user.uid, images, tags.getTags());
                  Navigator.pop(context);
                }, 
                child: Text('Create Post'),
            ),
            Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            ),
          ],
        ),
      ), 
    );
  }

  //Called if the user selects the option to take a picture with their camera
  _imgFromCamera() async {
    //Waits for the user to take a picture and stores it in File object
    File image = await ImagePicker.pickImage(source: ImageSource.camera, imageQuality: 50);
    //Updates the state with the new image. imageCache is called to prevent flutter from using cached images
    setState(() {
      imageCache.clear();
      _image = image;

      //Add the image to the list of images that will be used to upload to the database
      images.add(_image);
    });

    //Add the taken picture to the list of boxes so its displayed on screen
    addPicToBoxes();
  }

  //Called if the user selects the option to pick an image from their gallery
  _imgFromGallery() async {
    //Waits for the user to select a picture and stores it in File object
    File image = await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    //Updates the state with the new image. imageCache is called to prevent flutter from using cached images
    setState(() {
      imageCache.clear();
      _image = image;

      //Add the image to the list of images that will be used to upload to the database
      images.add(_image);
    });

    //Add the chosen picture to the list of boxes so its displayed on screen
    addPicToBoxes();
  }

  //Modal pops up on the bottom of the screen providing options to take a picture or pick one from gallery
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery(); //Function call for picking an image from the gallery
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      _imgFromCamera(); //Function call for taking an image with the camera
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

}