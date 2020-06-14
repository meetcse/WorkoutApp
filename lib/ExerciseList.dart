class ExerciseList {
  String _name;
  String _imageURL;

  ExerciseList(this._name, this._imageURL);

  //getters
  String get name => _name;
  String get imageURL => _imageURL;

  //setters
  set name(String n) {
    _name = n;
  }

  set imageURL(String i) {
    _imageURL = i;
  }
}
