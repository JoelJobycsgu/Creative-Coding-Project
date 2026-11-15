String[] data;
int[] day;
int[] Communication; // Yellow
int[] Entertainment; // Green
int[] Socials; // Purple
int[] Information; // Blue
int[] Total;

int selectedDay = 1;
boolean showTotal = false;
void setup() {
  size(600, 600); // Size of the canvas
  data = loadStrings("Hourly usage.csv"); // Loads all the strings from the CSV file

  println(data.length);
  day = new int[data.length - 1];
  Communication = new int[data.length - 1];
  Entertainment = new int[data.length -1];
  Socials = new int[data.length - 1];
  Information = new int[data.length - 1];
  Total = new int[data.length -1];

  // Reads the CSV data
  for (int i=1; i<data.length; i=i+1) {   // Goes through every array
    String [] token = split(data[i], ',');   // Splits the data using comma
    println(data[i]);
  }
}
void draw() {
  background(255);

  fill(0); // Set font colour as black
  textSize(20); // Text size
  textAlign(LEFT);


  if (showTotal == true) {
    text("Selected view Total", 300, 50);
  } 
  else {
  text("Selected view: Day " + selectedDay, 300, 50);
  }

  line(75, 30, 75, 505); // Y-Axis Graph
  line(75, 505, 505, 505); // X-Axis Graph

  textSize(20);
  for (int j=0; j<24; j=j+1) {
    float y = map(j, 0, 23, 40, 500);
    text(nf(j, 2) + ":00", 23, y+4); // Display the hour
  }
}

void keyPressed() {
  if (key >= '1' && key <='5') {
    selectedDay = key - '0';
    showTotal = false;
  } else if (key == 't'||key == 'T') {
    showTotal = true;
  }
}
