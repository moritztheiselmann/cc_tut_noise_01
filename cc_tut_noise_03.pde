float x;
float y;

int frameCounter;
int totalFrames = 450;
boolean recording = true;

void setup() {
  size(1000, 1000); 
  x = width/2;
  y = height/2;
  background(20);
}

void draw() {
  background(20);
  float percent = 0;
  if (recording) {
    percent = float(frameCounter) / totalFrames;
  } else {
    percent = float(frameCounter % totalFrames) / totalFrames;
  }

  render(percent);

  if (recording) {
    saveFrame("output/gif-"+nf(frameCounter, 3)+".png");
    if (frameCounter == totalFrames-1) {
      exit();
    }
  }
  frameCounter++;
}

void render(float percent) {
  //fill(20, 75);
  //rect(0, 0, width, height);
  background(20);
  float a = percent * TWO_PI;

  x = map(getNoise(a, 125, 0.001, 150, 150), 0, 1, 0, width);
  y = map(getNoise(a, 125, 0.002, 75, 250), 0, 1, 0, height);


  noStroke();
  fill(255);
  circle(x, y, 100);
}

float getNoise(float angle, float radius, float noiseScale, float x, float y) {
  float xoff = map(cos(angle), 0, 1, x, x + radius*2);
  float yoff = map(sin(angle), 0, 1, y, y + radius*2);
  float noiseVal = noise(xoff * noiseScale, yoff * noiseScale);

  return noiseVal;
}
