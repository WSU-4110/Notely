import 'package:Notely/models/DemoPosts.dart';
import 'dart:core';

class Postmaster{
  List<DemoPost> postList = []; 
  //File fileName; //This would be replaced with firebase url
  
  Postmaster(){
    //postList = new List;
    print("Postmaster has been created");
    //fileName = new File('demodata.txt'); 
    loadPosts();
    print("Post text in 1st slot = " + postList[0].title);
  }

  void loadPosts(){

    //I had to hardcode these because file reading was giving me issues, and I need them for testing purposes
    postList.add(new DemoPost("CSC 3200 Notes", "https://3.bp.blogspot.com/-BDAGgWkK1-Y/VcPBhjZeR6I/AAAAAAAABiY/svh4aNkHPAo/s1600/IMG_8819_picmonkeyed.jpg"));
    postList.add(new DemoPost("ART 4100 Lecture", "https://kaylablogs.com/wp-content/uploads/2016/09/aphasia-notes.jpg"));
    postList.add(new DemoPost("MTH 2150 Complex Numbers", "https://wallpapercave.com/wp/wp6810211.jpg"));

    //This function is not reading the file as intended
    // fileName.readAsLines().then((value) => 
    //   (){
    //       for (int i = 0; i < value.length; i += 2)
    //       {
    //         print(value[i]);
    //         postList[i] = new DemoPost(value[i], value[i+1]);

    //       }
    //     }
    //);
  }
}