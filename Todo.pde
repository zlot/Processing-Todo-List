/**** VIEW CLASS ****/
class Todo {
  
  int id;
  String idAsString;
  int btnwh = todoHeight; // button width/height

  DoneListener doneListener;
  CancelListener cancelListener;

  
  /**** CONSTRUCTORS ****/  
  Todo(Item item) {
    id = frameCount; // primary id.
    doneListener = new DoneListener();
    cancelListener = new CancelListener();
    drawTodo(item);
    drawDone();
    drawCancel();
    //todoStack.add(this);
  }

  void drawTodo(Item item) {
    cp5.addTextfield(id + "")
      .setPosition(leftMargin, topMargin+itemCollection.size()*todoHeight+todoPadding)
      .setSize(width-leftMargin*3, todoHeight)
      .setText(item.getTitle())
      .setFont(font)
      .setLabelVisible(false) // not working it seems.
      .setLabel("")
      ;
  }
  void drawDone() {
    cp5.addBang(id + "done") // looks like eg "1done"
      .setPosition(width-leftMargin-btnwh*1.4, topMargin+itemCollection.size()*todoHeight+todoPadding)
      .setSize(round(btnwh*1.4), btnwh)
      .setLabel("Done")
      .addListener(doneListener)
      .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
      ;
  }
  void drawCancel() {
    cp5.addBang(id + "cancel") // looks like eg "1cancel"
      .setPosition(width-leftMargin-btnwh*2-(btnwh*1.4-btnwh), topMargin+itemCollection.size()*todoHeight+todoPadding)
      .setSize(btnwh, btnwh)
      .setLabel("X")
      .addListener(cancelListener)
      .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
      ;
  }
  
  void remove() {
    cp5.remove(id+"");
    cp5.remove(id+"done");
    cp5.remove(id+"cancel");
  }
  
  /**** LISTENERS *****/
  class DoneListener implements ControlListener {
    public void controlEvent(ControlEvent theEvent) {
      // add to done list
      
      // remove item from itemCollection
      itemCollection.remove(id);
      remove();
     // Item createdItem = new Item(newTodo.getText()); // (could also say theEvent.getController().getText();)
     // itemCollection.add(createdItem); 
     // new Todo(createdItem);
    }
  }  
  class CancelListener implements ControlListener {
    public void controlEvent(ControlEvent theEvent) {
      // add to done list
      
      // remove item from itemCollection
      itemCollection.remove(id);
      // remove todo from todoStack
      remove();
     // Item createdItem = new Item(newTodo.getText()); // (could also say theEvent.getController().getText();)
     // itemCollection.add(createdItem); 
     // new Todo(createdItem);
    }
  }  
  
  
  
}
