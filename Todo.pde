/**** VIEW CLASS ****/
class Todo {
  
  int id;
  int stackingOrder;
  int btnwh = todoHeight; // button width/height
  boolean doneFlag = false;

  String title;

  DoneListener doneListener;
  CancelListener cancelListener;
  Bang done;
  Bang cancel;
  Textfield textfield;
  
  /**** CONSTRUCTORS ****/  
  Todo(int _id, String t, int _stackingOrder) {
    id = _id; // primary id.
    title = t;
    stackingOrder = _stackingOrder;
    doneListener = new DoneListener();
    cancelListener = new CancelListener();
    drawTodo();
    drawDone();
    drawCancel();
  }

  void drawTodo() {
    textfield = cp5.addTextfield(id + "")
      .setPosition(leftMargin, topMargin+(stackingOrder)*todoHeight+todoPadding)
      .setSize(width-leftMargin*3, todoHeight)
      .setText(title)
      .setFont(font)
      .setLabelVisible(false) // not working it seems.
      .setLabel("")
      ;
  }
  void drawDone() {
    done = cp5.addBang(id + "done") // looks like eg "1done"
      .setPosition(width-leftMargin-btnwh*1.4, topMargin+(stackingOrder)*todoHeight+todoPadding)
      .setSize(round(btnwh*1.4), btnwh)
      .setLabel("Done")
      .addListener(doneListener)
      ;
    done.getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
  }
  void drawCancel() {
    cancel = cp5.addBang(id + "cancel") // looks like eg "1cancel"
      .setPosition(width-leftMargin-btnwh*2-(btnwh*1.4-btnwh), topMargin+(stackingOrder)*todoHeight+todoPadding)
      .setSize(btnwh, btnwh)
      .setLabel("X")
      .addListener(cancelListener)
      .setColorForeground(color(#00466a));
      ;
    cancel.getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
  }
  
  Todo setStackingOrder(int i) {
    stackingOrder = i;
    return this;
  }
  
  Todo redrawTextfield() {
    textfield.setPosition(leftMargin, topMargin+(stackingOrder+1)*todoHeight+todoPadding);
    return this;
  }
  Todo redrawDone() {
    done.setPosition(width-leftMargin-btnwh*1.4, topMargin+(stackingOrder+1)*todoHeight+todoPadding);
    return this;
  }
  Todo redrawCancel() {
    cancel.setPosition(width-leftMargin-btnwh*2-(btnwh*1.4-btnwh), topMargin+(stackingOrder+1)*todoHeight+todoPadding);
    return this;
  }
  
  void remove() {
    todoHashMap.remove(id);
    cp5.remove(id+"");
    cp5.remove(id+"done");
    cp5.remove(id+"cancel");
    todoOrder.remove(todoOrder.indexOf(id));
    
    // for each primaryId stored in todo order,
    //   find each Todo in HashMap,
    //   and redraw each title, done and cancel into their new places.
    for(int i : todoOrder) {
      todoHashMap.get(i)
        .setStackingOrder(todoOrder.indexOf(i))
        .redrawTextfield()
        .redrawDone()
        .redrawCancel()
        ;
    }
  }
  
  void doneAction() {
    textfield.setColorBackground(color(0,180,0)).lock();
    done.setColorBackground(color(0,180,0));
    doneFlag = !doneFlag;
  }
  void unDoneAction() {
    textfield.setColorBackground(color(#02344D)).unlock();
    doneFlag = !doneFlag;
  }
  
  /**** LISTENERS *****/
  class DoneListener implements ControlListener {
    public void controlEvent(ControlEvent theEvent) {
      if(!doneFlag)
        doneAction();
      else
        unDoneAction();
    }
  }  
  class CancelListener implements ControlListener {
    public void controlEvent(ControlEvent theEvent) {
      remove();
    }
  }  
  
  
  
}
