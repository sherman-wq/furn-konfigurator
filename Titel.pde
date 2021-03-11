
class titel {
  String TextValue;
  float xPos = 0;
  float yPos = 0;
  int Size;
  PFont myFontUI;  
  color Color;


  titel(String Text, float X, float Y) {
    this.Size = 25;
    this.TextValue = Text;
    this.xPos = X;
    this.yPos = Y;
    this.Color = #000000;
    this.myFontUI = createFont("Roboto-Regular.ttf", this.Size);
    textFont(this.myFontUI);
  }

  titel(float X, float Y) {
    this.Size = 25;
    this.xPos = X;
    this.yPos = Y;
    this.Color = #000000;
    this.myFontUI = createFont("Roboto-Regular.ttf", this.Size);
    textFont(this.myFontUI);
  }
  void setSize(int _Size) {
    this.Size=_Size;
    textFont(this.myFontUI, _Size);
  }
  void changeSize(int _changeValue) {
    this.Size += _changeValue; 
    textFont(this.myFontUI, this.Size);
  }
  void setLabel(String _Text) {
    this.TextValue = _Text;
  } 
  void setColor(color _Color) {
    this.Color = _Color;
  }


  void changeFont(String FontName, int Size) {
    this.myFontUI = createFont(FontName, Size);
    textFont(this.myFontUI);
  }

  void draw() {
    fill(this.Color);
    text(this.TextValue, this.xPos, this.yPos);
  }
}
