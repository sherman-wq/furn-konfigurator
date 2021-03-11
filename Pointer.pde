class Pointer {

  int x, y;
  int radius;

  sliderPointsGroup host;

  boolean Status;

  color cicrleColor;

  Pointer(int x, int y) {
    this.x = x;
    this.y = y;
    this.radius = 15;
    this.Status = false;
  }

  void setSliderPointsGroup(sliderPointsGroup _host) {
    this.host = _host;
  }


  void draw() {
    if (Status) {
      fill(0);
    } else {
      noFill();
    }
    circle(x, y, radius); 
    line(x, y + 20, x, y + 35);
  }
}
