slider sliderTest;
titel Farbe_label, Material_label, Radio_label;

RadioGroup left_boxes, right_boxes;

String[] FarbeLabels = {"Grau", "Rot", "Blau"};
String[] MaterialLabels = {"Microfaser", "Leder", "Samt"};

boolean isChecked = false;
boolean textureStatement = false;
boolean noBlend;       


color currentTintColor; 
color[] TintColors; // Array of all colors

PImage BackImage, FrontImage, TextureImage, MaskeImage; 
PImage[] BackgroundImages, OnSurfaceImages, TextureImages;


void setup() {
  size(1920, 1080);
  BackgroundImages = new PImage[] {
    loadImage("0.png"), 
    loadImage("1.png"), 
    loadImage("2.png")
  };
  TintColors = new color[] {#757575, #d30110, #0099cc};
  currentTintColor = #757575;

  OnSurfaceImages = new PImage[] {
    loadImage("10.png"), 
    loadImage("11.png")
  };

  TextureImages = new PImage[] {
    loadImage("20.png"), 
    loadImage("21.png"), 
    loadImage("22.png")
  };

  TextureImage = loadImage("20.png");
  MaskeImage = loadImage("Maske.png");

  sliderTest = new slider(1400, 200, 350, 20);
  sliderTest.myValue = 0;
  sliderTest.addStateChangeEventHandler(new SliderStateChangeEventHandler() {
    @Override
      public void StateChangeHandler(int oldValue, int newValue) {
      if (oldValue != newValue && newValue >= 0 && newValue < BackgroundImages.length) {
        isChecked = newValue != 0;
        textureStatement = newValue != 0;
        BackImage = BackgroundImages[newValue];
        newValue--;
        if (newValue >= 0) {
          FrontImage = OnSurfaceImages[newValue];
        }
      }
    }
  }
  );
  left_boxes = InitializeCheckBoxes(new PVector(1400, 365), FarbeLabels);
  right_boxes = InitializeCheckBoxes(new PVector(1590, 365), MaterialLabels);

  left_boxes.addRadioGroupChangeEventHandler(new RadioGroupChangeEventHandler() {
    @Override
      public void RadioGroupHandler(int newIndex) {
      if (newIndex >= 0 && newIndex < TintColors.length) {
        currentTintColor = TintColors[newIndex];
      }
    }
  }
  );



  right_boxes.addRadioGroupChangeEventHandler(new RadioGroupChangeEventHandler() {
    @Override
      public void RadioGroupHandler(int newIndex) {
      if (newIndex >= 0 && newIndex < TextureImages.length) {
        TextureImage = TextureImages[newIndex];
      }
    }
  }
  );

  Farbe_label = new titel("Farbe", 1400, 340); //1400
  Material_label = new titel("Material", 1590, 340);
  BackImage = BackgroundImages[0];
  FrontImage = OnSurfaceImages[0];
}

void draw() {

  image(BackImage, 0, 0);
  if (isChecked) {
    tint(currentTintColor);
    image(FrontImage, 0, 0); 
    noTint();
  }
  if (textureStatement) { 
    TextureImage.mask(MaskeImage); 
    blend(TextureImage, 0, 0, 1920, 1080, 0, 0, 1920, 1080, SOFT_LIGHT);
  }

  sliderTest.draw();
  Farbe_label.draw();
  Material_label.draw();
  left_boxes.draw();
  right_boxes.draw();
}

RadioGroup InitializeCheckBoxes(PVector RenderPoint, String[] _Labels) {
  smooth();
  RadioGroup obj = new RadioGroup();
  for (int i=0; i< 3; i++) {
    obj.addCheckbox(new Checkbox(RenderPoint.x, RenderPoint.y + 30 * i, _Labels[i]));
  }
  return obj;
}



boolean insideRect(int xPos, int yPos, int targetXPos, int targetYPos, int targetWidth, int targetHeight) {
  if (xPos > targetXPos && xPos < targetXPos + targetWidth && yPos > targetYPos && yPos < targetYPos + targetHeight) {
    return true;
  }
  return false;
}

void mousePressed() {
  sliderTest.mousePressed();
  left_boxes.mousePressed();
  right_boxes.mousePressed();
}

void mouseDragged() {
  sliderTest.mouseDragged();
}

void mouseReleased() {
  sliderTest.mouseReleased();
}
