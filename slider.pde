class slider {
  int xPos = 0;
  int yPos = 0;
  int myWidth;
  int myHeight;
  color backgroundColor = color(#000000);
  color forgroundColor = color(#000000);
  float myValue = 1.0;
  boolean dragState = false;
  int Steps = 3;
  int State = 0;
  String Path;
  sliderPointsGroup sliderPointsObj;
  Pointer currentPoint;
  ArrayList<SliderStateChangeEventHandler> stateChangeEventHandlers;
  String[] Konfiguration = {"Ohne Möbel", "Nur Sofa", "Sofa mit einem Sessel"};
  titel KonfigurationLabel, currentKonfigurationLabel;




  slider(int Xpos, int Ypos, int myWidth, int myHeight) {
    this.xPos = Xpos;
    this.yPos = Ypos;
    this.myWidth = myWidth;
    this.myHeight = myHeight;
    sliderPointsObj = InitializeSliderPoints();
    KonfigurationLabel = new titel("Konfiguration: ", Xpos, Ypos+85);
    currentKonfigurationLabel = new titel(Konfiguration[0], Xpos+165, Ypos+85);
    currentKonfigurationLabel.setSize(6); //<>// //<>//
    ;    
    stateChangeEventHandlers = new ArrayList<SliderStateChangeEventHandler>();
  }

  void draw() {
    pushMatrix();
    translate(xPos, yPos);
    //noStroke();
    stroke(153, 153, 153);
    fill(#E6E6E6);
    rect(0, 0, myWidth, myHeight, 12, 12, 12, 12);
    fill(forgroundColor);
    stroke(backgroundColor);
    strokeWeight(2);
    fill(230, 230, 230);
    rect(0 + (myWidth - myHeight) * myValue, 0 - myHeight * 0.5, myHeight, myHeight*2, 12, 12, 12, 12);
    popMatrix();
    sliderPointsObj.draw();
    KonfigurationLabel.draw();
    currentKonfigurationLabel.draw();
  }

  sliderPointsGroup InitializeSliderPoints() { /*  X and Y */
    int stepsWidth = myWidth / (Steps-1) - 10;
    sliderPointsGroup obj = new sliderPointsGroup();
    for (int i = 0; i<Steps; i++) {
      obj.addPoint(new Pointer(this.xPos + 10 + i*stepsWidth, this.yPos - 60)); // X и Y расчет
    }
    return obj;
  }

  void drawColorgradient() {
    for (int i = 0; i < myWidth-4; i++) {
      noStroke();
      colorMode(HSB, myWidth-4, 100, 100);
      fill(i, 50, 90);
      rect(2+i, 2, 1, myHeight-4);
    }
  }

  void mousePressed() {
    if (insideRect(mouseX, mouseY, xPos, yPos, myWidth, myHeight)) {
      dragState = true; //<>//
      myValue = constrain((mouseX - xPos)/float(myWidth), 0, 1); //<>//
      float temp = Math.round(myValue * (Steps-1));
      myValue = temp/(Steps-1);
      if ((int)temp != State) {
        for (SliderStateChangeEventHandler handler : stateChangeEventHandlers)
          handler.StateChangeHandler(State, (int)temp);
      }
      State = (int)temp;
      Pointer currentPoint = sliderPointsObj.sliderPoints.get(State);
      currentPoint.Status = true;
      sliderPointsObj.unChecked(currentPoint);
    }
  }

  void mouseDragged() {
    if (dragState) {
      myValue = constrain((mouseX  - xPos)/float(myWidth), 0, 1);
      float temp = Math.round(myValue * (Steps-1));
      if ((int)temp != State)
        for (SliderStateChangeEventHandler handler : stateChangeEventHandlers)
          handler.StateChangeHandler(State, (int)temp);
      State = (int)temp;
      Pointer currentPoint = sliderPointsObj.sliderPoints.get(State);
      currentPoint.Status = true;
      sliderPointsObj.unChecked(currentPoint);
      currentKonfigurationLabel.setLabel(Konfiguration[State]);
      myValue = temp/(Steps-1);
    } //<>//
  }

  void mouseReleased() {
    dragState = false;
  }

  void addStateChangeEventHandler(SliderStateChangeEventHandler handler) {
    stateChangeEventHandlers.add(handler);
  }

  void removeStateChangeEventHandler(SliderStateChangeEventHandler handler) {
    stateChangeEventHandlers.remove(handler);
  }
}
