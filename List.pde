/**** VIEW CLASS ****/
class List {

  Textfield newTodo;
  Listener newTodoListener;

  
  /**** CONSTRUCTORS ****/  
  List() {
    newTodoListener = new Listener();
    
    newTodo = cp5.addTextfield("newTodo")
      .setPosition(leftMargin,topMargin)
      .setSize(width-leftMargin*2,todoHeight)
      .setFocus(true)
      .setText("Code something cool")
      .setFont(font)
      .setLabelVisible(false) // not working it seems.
      .setLabel("")
      .addListener(newTodoListener);
  }
  
  void draw() {
    
  }
  
  class Listener implements ControlListener {
    /* every control event is automatically forwarded to the function controlEvent(ControlEvent)
     * inside a sketch if such function is available.
     */
    public void controlEvent(ControlEvent theEvent) {
      //if(theEvent.getName() == "newTodo")
      // NOTE:: Do not need the above clause because this listener's scope is restricted to
      //        the controller which it has been attached! (the newTodo textfield).
      Item createdItem = new Item(newTodo.getText()); // (could also say theEvent.getController().getText();)
      itemCollection.add(createdItem); 
      new Todo(createdItem);
    }
  }
}
