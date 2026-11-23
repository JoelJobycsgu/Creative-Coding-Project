String[] data;
int[] hour;
int[] day;
int[] Communication; // Yellow
int[] Entertainment; // Green
int[] Socials;       // Purple
int[] Information;   // Blue
int[] Total; 

int selectedDay = 1; // Default selected day
boolean showTotal = false;

void setup() {
  size(600, 600);
  data = loadStrings("Hourly usage.csv");

  day = new int[data.length - 1];
  hour = new int[data.length - 1];
  Communication = new int[data.length - 1];
  Entertainment = new int[data.length - 1];
  Socials = new int[data.length - 1];
  Information = new int[data.length - 1];
  Total = new int[data.length - 1];

  // Reads the CSV data from the file
  for (int i = 1; i < data.length; i++) {
    String[] token = split(data[i], ',');
    int k = i - 1;
    
    // Each one reads every single data given in the file
    day[k] = int(token[0]);
    hour[k] = int(split(token[1], ':')[0]); // "13:00" -> 13
    Entertainment[k] = int(token[2]);
    Socials[k] = int(token[3]);
    Information[k] = int(token[4]);
    Communication[k] = int(token[5]);
    Total[k] = int(token[6]);
  }
} 

void draw() {
  background(255);

  fill(0);
  textSize(25);
  textAlign(LEFT);
  
  
  // Displays the current view
  if (showTotal == true) {
    text("Selected view: Total", 300, 50);
  } else {
    text("Selected view: Day " + selectedDay, 300, 50);
  }

  line(75, 30, 75, 505);   // Y-axis
  line(75, 505, 505, 505); // X-axis

  // Hour labels
  textSize(17);
  for (int j = 0; j < 24; j++) {
    float labelY = map(j, 0, 23, 40, 500);
    text(nf(j, 2) + ":00", 23, labelY + 4);
  }

  // Bars
  if (!showTotal) {
    // Single day view
    for (int i = 0; i < day.length; i++) {
      int sum = Communication[i] + Entertainment[i] + Socials[i] + Information[i];
      if (day[i] == selectedDay && sum > 0) {
        float barY = map(hour[i], 0, 23, 40, 500);
        DisplayDay bar = new DisplayDay(barY, Communication[i], Entertainment[i], Socials[i], Information[i], 7);
        bar.display(); 
      }
    }
  } else {
    // Total view: adds up all days for each hour
    for (int h=0; h<24; h++) {
      int c=0, e=0, s=0, inf=0;
      
      for (int i=0; i < day.length; i++) {
        if (hour[i] == h) {
          c += Communication[i];
          e += Entertainment[i];
          s += Socials[i];
          inf += Information[i];
        }
      }

      if (c+e+s+inf>0) {
        float barY = map(h, 0, 23, 40, 500);
        DisplayDay bar = new DisplayDay(barY, c, e, s, inf, 1.7);
        bar.display();
      }
    }
  }
  
} 

void keyPressed() {
  if (key >= '1' && key <= '5') { // Keys that displayfor each day (1-5)
    selectedDay = key - '0';
    showTotal = false;
  } else if (key == 't' || key == 'T') { // Key that displays the total minutes
    showTotal = true;
  }
} 
