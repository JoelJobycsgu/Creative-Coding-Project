String[] data;
int[] hour;
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
  Information = new int[data.length - 1];
  Socials = new int[data.length - 1];
  Total = new int[data.length -1];
  hour = new int[data.length - 1];

  // Reads the CSV data
  for (int i = 1; i < data.length; i++) {
    String[] token = split(data[i], ','); // Splits the data separately using the commas
    int k = i - 1;
    
    // Extracts the data from the CSV file
    day[k] = int(token[0]);
    hour[k] = int(split(token[1], ':')[0]);
    Entertainment[k] = int(token[2]);
    Socials[k] = int(token[3]);
    Information[k] = int(token[4]);
    Communication[k] = int(token[5]);
    Total[k] = int(token[6]);
    
}
}
void draw() {
  background(255); // White background colour

  fill(0); // Black font colour
  textSize(20);
  textAlign(LEFT);

  if (showTotal == true) {
    text("Selected view Total", 300, 50);
  } else {
    text("Selected view: Day " + selectedDay, 300, 50);
  }

  line(75, 30, 75, 505); // Y-Axis
  line(75, 505, 505, 505); // X-Axis

  // Hour labels
  for (int j = 0; j < 24; j++) {
    float labelY = map(j, 0, 23, 40, 500);
    text(nf(j, 2) + ":00", 23, labelY + 4);
  }

  // Displaying the Bars 
  if (!showTotal) {
    for (int i = 0; i < day.length; i++) {
      int sum = Communication[i] + Entertainment[i] + Socials[i] + Information[i];
      if (day[i] == selectedDay && sum > 0) {
        float barY = map(hour[i], 0, 23, 40, 500);
        DisplayDay bar = new DisplayDay(barY, Communication[i], Entertainment[i], Socials[i], Information[i]);
        bar.display(); 
      }
    }
  }
} 


void keyPressed() {
  if (key >= '1' && key <= '5') { // Keys for each Day from 1-5
    selectedDay = key - '0';
    showTotal = false;
  } else if (key == 't' || key == 'T') { // Key for the total minutes spent
    showTotal = true;
  }
}
