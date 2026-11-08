String[] data;
int[] day;
int[] Communication; // Yellow
int[] Entertainment; // Green
int[] Socials; // Purple
int[] Information; // Blue
int[] Total;


void setup() {
  size(600, 500); // Size of the canvas
  color blue = color(#158BE3);
  color green = color(#17E32C);
  color yellow = color(#F7ED14);
  color purple = color(#8F1CC9);

  data = loadStrings("Hourly usage.csv"); // Loads all the strings from the CSV file
  textAlign(LEFT);
  
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
  for (int i=1; i<data.length; i=i+1) {   // Goes through every array
    String [] token = split(data[i], ',');   // Splits the data using comma
    println(data[i]);
    
    
    textSize(10);
    line(75, 30, 75, 420); 
    line(75, 420, 500, 420); 
    
    rect(75, 40, 200, 20);
  }
  


  
  noLoop(); // Stops from looping the same data over
}


// key press for each day
