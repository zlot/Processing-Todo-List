/**** MODEL CLASS ****/
class Item {
  
  String title;
  
  
  /**** CONSTRUCTORS ****/  
  Item() {
    title = "Untitled";    
  }

  Item(String t) {
    title = t;
  }


  /**** GETTERS ****/  
  String getTitle() {
    return title;
  }

  /**** SETTERS ****/  
  void setTitle(String t) {
    title = t;
  }
  
}
