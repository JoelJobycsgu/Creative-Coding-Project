String[] data;
int[] day;
int[] Communication; // Yellow
int[] Entertainment; // Green
int[] Socials; // Purple
int[] Information; // Blue
int[] Total;


void setup() {
  size(600, 600); // Size of the canvas
  color blue = color(#158BE3);
  color green = color(#17E32C);
  color yellow = color(#F7ED14);
  color purple = color(#8F1CC9);

  data = loadStrings("Hourly usage.csv"); // Loads all the strings from the CSV file

  println(data.length);
  day = new int[data.length - 1];
  Communication = new int[data.length - 1];
  Entertainment = new int[data.length -1];
  Socials = new int[data.length - 1];
  Information = new int[data.length - 1];
  Total = new int[data.length -1];
}

void draw() {
  background(255);
  println(data[0]);
  
  fill(0); // Set font colour as black
  textSize(20); // Text size
  textAlign(LEFT);

  line(75, 30, 75, 436); // Y-Axis Graph
  
  // Read the CSV data
  for (int i=1; i<data.length; i=i+1) {   // Goes through every array
    String [] token = split(data[i], ',');   // Splits the data using comma
    println(data[i]);
    
    noLoop(); // Stops from looping the same data over
  }
    for (int j=0; j<24; j++) {
      float y = map(j, 0, 23, 30, 420);
      text(nf(j, 2) + ":00", 23, y+4); // Display the hour
      line(75, y, 500, y);  // Creates mutiple lines
    }

}


// key press for each day
