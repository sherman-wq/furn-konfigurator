
class RadioGroup {
  ArrayList<Checkbox> RadioArray;
  int Index;
  ArrayList<RadioGroupChangeEventHandler> RadioGroupChangeEventHandlers;


  RadioGroup(Checkbox... _boxes) {
    RadioArray = new ArrayList<Checkbox>();
    for (int i = 0; i < _boxes.length; i++) {
      RadioArray.add(_boxes[i]);
    }
    RadioGroupChangeEventHandlers = new ArrayList<RadioGroupChangeEventHandler>();
  }

  void unChecked(Checkbox obj) {

    for (int i = 0; i < RadioArray.size(); i++) {
      if (RadioArray.get(i) != obj) {
        RadioArray.get(i).checked = false;
      }
    }
    Index = RadioArray.indexOf(obj);
    for (RadioGroupChangeEventHandler handler : RadioGroupChangeEventHandlers)
    {
      handler.RadioGroupHandler(Index);
    }
  }

  void addCheckbox(Checkbox obj) {
    obj.setRadioGroup(this);
    RadioArray.add(obj);
  }

  void draw() {
    for (int i = 0; i < RadioArray.size(); i++) {
      RadioArray.get(i).render();
    }
  }

  void mousePressed() {
    for (int i = 0; i < RadioArray.size(); i++) {
      RadioArray.get(i).click();
    }
  }

  void  addRadioGroupChangeEventHandler(RadioGroupChangeEventHandler handler) {
    RadioGroupChangeEventHandlers.add(handler);
  }

  void  removeRadioGroupChangeEventHandler(RadioGroupChangeEventHandler handler) {
    RadioGroupChangeEventHandlers.remove(handler);
  }
}
