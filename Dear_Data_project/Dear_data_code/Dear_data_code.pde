String[] data;
int[] day;
int[] Communication; // Yellow
int[] Entertainment; // Green
int[] Socials; // Purple
int[] Information; // Blue
int[] Total;


void setup() {
  size(600, 500);
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

int calculateTotal(int i) {   // Created a method
  int total = Entertainment[i] + Socials[i] + Information[i] + Communication[i];
  return total; // returns the value
}

void draw() {
  background(255);
  println(data[0]);                                                                                          
  for (int i=1; i<data.length; i=i+1) {   // Goes through every array
    String [] token = split(data[i], ',');   // Splits the data using comma
    println(data[i]);
    
    
    
    line(75, 30, 75, 420); 
    line(75, 420, 500, 420); 
    
    rect(75, 40, 200, 20);
  }
  
  int totalMinutes = calculateTotal(15);
  println(totalMinutes);

  println("Total usage: " + totalMinutes); // prints out the return value
  noLoop(); // Stops from looping the same data over
}

// key press for each day
