String[] data;
int[] day;
int[] Communication; // Yellow
int[] Entertainment; // Green
int[] Socials; // Purple
int[] Information; // Red

void setup() {
  size(1000, 600);
  color blue = color(#158BE3);
  color green = color(#17E32C);
  color yellow = color(#F7ED14);
  color purple = color(#8F1CC9);

  data = loadStrings("Hourly usage.csv");

  println(data.length);
  day = new int[data.length - 1];
  Communication = new int[data.length - 1];
  Entertainment = new int[data.length -1];
  Socials = new int[data.length - 1];
  Information = new int[data.length - 1];
}

int calculateTotal(int i) {   // Created a method
  int total = Entertainment[i] + Socials[i] + Information[i] + Communication[i];
  return total; // returns the value
}

void draw() {
  background(255);
  // key Press technique for each day
  for (int i=1; i<data.length; i=i+1) {
    String [] token = split(data[i], ',');
  }
  int totalMinutes = calculateTotal(15);

  println("Total usage: " + totalMinutes); // prints out the return value
  println(data);
  noLoop();
}
