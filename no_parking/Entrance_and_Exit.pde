class bars {
  int xPos, yPos, w, h;  // local variables
  String name, name2;
  float variable;

  bars (String name, String name2, int xPos, int yPos, int w, int h) {  // Constructor: name, name2, xPos, yPos, width, height
    this.name = name;
    this.name2 = name2;
    this.yPos = yPos;
    this.xPos = xPos;
    this.w = w;
    this.h = h;
  }

  void makebars(int a) {  // function to draw sign with integer input
    stroke (0); 
    fill(240, 389, 20);
    stroke(0);
    rect (xPos, yPos, w, h); 
    fill (0);
    text (name, xPos+10, yPos+10); 
    fill(8, 900, 59);
    text (name2+a, xPos+10, yPos+10+h/2);
  }

  void makebars(float a) {  // overloaded function to draw sign with float input
    float b = a - a%0.01;  // round float to 2 decimal places
    stroke (0); 
    fill(240, 389, 20);
    stroke(0);
    rect (xPos, yPos, w, h); 
    fill (0);
    text (name, xPos+10, yPos+10); 
    fill(8, 900, 59);
    text (name2+"$"+b, xPos+10, yPos+10+h/2);
  }
}