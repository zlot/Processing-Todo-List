import controlP5.*;
import java.util.Stack;

ArrayList itemCollection;
//Stack todoStack;
PFont font;
String testString;
color bgCol;
ControlP5 cp5;
int leftMargin;
int topMargin;
int todoHeight;
int todoPadding;
List list;


void setup() {
  size(350, 600);
  frameRate(60);

  leftMargin = 30;
  topMargin = 30;
  todoHeight = 34;
  todoPadding = 12;
  bgCol = color(30);
  font = loadFont("MS-PGothic-20.vlw");
  textFont(font, 20);
  testString = "Buy some Soymilk";
  
  cp5 = new ControlP5(this);
  itemCollection = new ArrayList<Item>();
 // todoStack = new Stack<Todo>();
  
  list = new List();
}


void draw() {
  background(bgCol);  // refresh background constantly.
  fill(230);
  text(testString, 30, 160);
  
}

