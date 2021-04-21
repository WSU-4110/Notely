import 'package:Notely/models/Post.dart';
import 'package:flutter_test/flutter_test.dart';

/*
  List<String> getImages(){
    return this.images;
  }

  List<String> setImages(List<String> newImages){
    this.images = newImages;
    return this.images;
  }
*/

void main() {
  test('Post should return user ID of 123456789', () async {
    // ARRANGE
    List<String> tags, images;
    Post post = new Post.Julian(uid: "123456789", title: "Post Title", date: "01/29/2020", tags: tags, images: images);
    // ACT

    // ASSERT
    expect(post.getUID(), "123456789");
  });

  test('Post should return title name of Post Title', () async {
    // ARRANGE
    List<String> tags, images;
    Post post = new Post.Julian(uid: "123456789", title: "Post Title", date: "01/29/2020", tags: tags, images: images);
    // ACT

    // ASSERT
    expect(post.getTitle(), "Post Title");
  });

  test('Post set the title to new value "new title" and then return "new title"', () async {
    // ARRANGE
    List<String> tags, images;
    Post post = new Post.Julian(uid: "123456789", title: "Post Title", date: "01/29/2020", tags: tags, images: images);
    // ACT

    // ASSERT
    expect(post.setTitle('new title'), "new title");
  });

  test('Post should return the date it was created: 01/29/2020', () async {
    // ARRANGE
    List<String> tags, images;
    Post post = new Post.Julian(uid: "123456789", title: "Post Title", date: "01/29/2020", tags: tags, images: images);
    // ACT

    // ASSERT
    expect(post.getDate(), "01/29/2020");
  });

  test('Post update date to "04/11/2021" and return "04/11/2021"', () async {
    // ARRANGE
    List<String> tags, images;
    Post post = new Post.Julian(uid: "123456789", title: "Post Title", date: "01/29/2020", tags: tags, images: images);
    // ACT

    // ASSERT
    expect(post.setDate('04/11/2021'), "04/11/2021");
  });

  test('Post should return the list of tags ["Hello", "World"]', () async {
    // ARRANGE
    List<String> tags = ["Hello", "World"];
    List<String> images;
    Post post = new Post.Julian(uid: "123456789", title: "Post Title", date: "01/29/2020", tags: tags, images: images);
    // ACT
  
    // ASSERT
    expect(post.getTags(), ['Hello', 'World']);
  });

  test('Post update tags to new value and return new value ["Goodbye", "Everyone"]', () async {
    // ARRANGE
    List<String> tags = ["Hello", "World"];
    List<String> images;
    Post post = new Post.Julian(uid: "123456789", title: "Post Title", date: "01/29/2020", tags: tags, images: images);
    // ACT
    List<String> newTags = ["Goodbye", "Everyone"];
    // ASSERT
    expect(post.setTags(newTags), ["Goodbye", "Everyone"]);
  });

  test('Post should return a list of the images ["image1", "image2"]', () async {
    // ARRANGE
    List<String> tags;
    List<String> images = ['image1', 'image2'];
    Post post = new Post.Julian(uid: "123456789", title: "Post Title", date: "01/29/2020", tags: tags, images: images);
    // ACT

    // ASSERT
    expect(post.getImages(), ['image1', 'image2']);
  });

  test('Post update images to new value and return new value', () async {
    // ARRANGE
    List<String> tags;
    List<String> images = ['image1', 'image2'];
    Post post = new Post.Julian(uid: "123456789", title: "Post Title", date: "01/29/2020", tags: tags, images: images);
    // ACT
    List<String> newImages = ['image3', 'image4'];
    // ASSERT
    expect(post.setImages(newImages), ['image3', 'image4']);
  });
}