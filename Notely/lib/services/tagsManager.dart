class TagsManager {

  List<String> _tags;

  TagsManager(){
    this._tags = new List();
  }

  void addTag(String tagToAdd){
    this._tags.add(tagToAdd);
  }

  List<String> getTags(){
    return this._tags;
  }

  void removeTag(int index){
    _tags.removeAt(index);
  }

}