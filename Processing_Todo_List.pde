import controlP5.*;

ArrayList<Integer> todoOrder;
HashMap<Integer, Todo> todoHashMap;
int primaryId;

PFont font;
String testString;
color bgCol;
ControlP5 cp5;
int leftMargin;
int topMargin;
int todoHeight;
int todoPadding;
List list;

color behindTextColor;

void setup() {
  size(350, 600);
  frameRate(60);

  leftMargin = 30;
  topMargin = 30;
  todoHeight = 34;
  todoPadding = 12;
  bgCol = color(30);
  behindTextColor = #02344D;
  font = loadFont("MS-PGothic-20.vlw");
  textFont(font, 20);  
 
  cp5 = new ControlP5(this);
  todoHashMap = new HashMap<Integer, Todo>(100);
  primaryId = 0; // init to 0.
  todoOrder = new ArrayList<Integer>();

  list = new List();
}


void draw() {
  background(bgCol);  // refresh background constantly.
}

