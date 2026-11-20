class DisplayDay{
  float y;
  int comm, ent, soc, info;
  
  DisplayDay(float y, int comm, int ent, int soc, int info){
    this.y = y;
    this.comm = comm;
    this.ent = ent;
    this.soc = soc;
    this.info = info;
  }
  void display() {
    float scale = 7;   // pixels per minute
    float x = 76;
    noStroke();

    fill(255, 220, 0);  // Communication (yellow)
    rect(x, y - 8, comm*scale, 16);
    x += comm * scale;

    fill(0, 180, 80);   // Entertainment (green)
    rect(x, y - 8, ent*scale, 16);
    x += ent * scale;

    fill(150, 80, 200); // Socials (purple)
    rect(x, y - 8, soc*scale, 16);
    x += soc * scale;

    fill(40, 120, 255); // Information (blue)
    rect(x, y - 8, info*scale, 16);
  }
}
