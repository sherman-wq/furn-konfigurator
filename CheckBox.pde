
public class Checkbox {
  float x, y;
  RadioGroup host;
  boolean checked;
  String label;
  titel CheckboxFont;


  Checkbox(float _x, float _y, String _labelText) {
    x = _x;
    y = _y;
    checked = false;
    label = _labelText;
  }
  void render() {
    stroke(153);
    fill(isOver()?245:230);
    rect(x, y, 20, 20, 2, 2, 2, 2);

    if (checked) {
      line(x, y, x+20, y+20);
      line(x, y+20, x+20, y);
    }    
    fill(#000000);
    text(label, x+30, y+20);
  }

  void setRadioGroup(RadioGroup _host) {
    this.host = _host;
  }

  void click() {
    if (isOver()) {
      checked=true; 
      host.unChecked(this);
    }
  }
  boolean isOver() {
    return(mouseX>x&&mouseX<x+20&&mouseY>y&&mouseY<y+20);
  }
}
