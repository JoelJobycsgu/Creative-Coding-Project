String[] data;

void setup() {
  size(1000, 600);

  data = loadStrings("Hourly usage.csv");

  println(data.length);
}

void draw() {
  background(255);
  for(int i=1; i<data.length; i=i+1){
    String [] values = split(data[i], ',');
    println(values);
  }
  noLoop();
}
