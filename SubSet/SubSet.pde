String[] gedekteKaarten;
String[] geschudKaarten;

void setup() {
  size(640, 480);

  gedekteKaarten = genereerKaarten(eigenschappen);
  println("Gedekte kaarten:");
  printArray(gedekteKaarten);
  geschudKaarten = kaartenSchudden(gedekteKaarten);
  println("Geschudde kaarten:");
  printArray(geschudKaarten);
  
}

void draw() {
  clear();
  tekenTafelDek();
  tekenMenu();
  
  for(int test = 0; test < 9; test++)
  {
    tekenKaart(geschudKaarten[test], test);
  }
  
  tekenStapelKaarten(18);
}