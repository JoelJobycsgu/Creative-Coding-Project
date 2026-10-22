String[] data;
int[] day;
int[] Communication;
int[] Entertainment;
int[] Socials;
int[] Information;
void setup() {
  size(1000, 600);

  data = loadStrings("Hourly usage.csv");

  println(data.length);
  day = new int[data.length - 1];
  Communication = new int[data.length - 1];
  Entertainment = new int[data.length - 1];
  Socials = new int[data.length - 1];
  Information = new int[data.length - 1];
}

void draw() {
  background(255);
 
  for(int i=1; i<data.length; i=i+1){
    String [] values = split(data[i], ',');
    
    
    println(values);
  }
  noLoop();
}
