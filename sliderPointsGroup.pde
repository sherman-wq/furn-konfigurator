class sliderPointsGroup {
  ArrayList<Pointer> sliderPoints;
  int Index;

  sliderPointsGroup(Pointer... _points) {
    sliderPoints = new ArrayList<Pointer>();
    for (int i = 0; i < _points.length; i++) {
      sliderPoints.add(_points[i]);
    }
  }

  void draw() {
    for (int i = 0; i < sliderPoints.size(); i++) {
      sliderPoints.get(i).draw();
    }
  }

  void addPoint(Pointer obj) {
    obj.setSliderPointsGroup(this);
    sliderPoints.add(obj);
  }

  void unChecked(Pointer obj) {

    for (int i = 0; i < sliderPoints.size(); i++) {
      if (sliderPoints.get(i) != obj) {
        sliderPoints.get(i).Status = false;
      }
    }
    Index = sliderPoints.indexOf(obj);
  }
}
