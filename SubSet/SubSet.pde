String[] gedekteKaarten;
String[] geschudKaarten;
String[] openKaarten = new String[9];
int nGedekteKaarten;
int[] geselecteerdePosities = {-1, -1, -1};
int nGeselecteerdePosities = 0;
int muisOverKaart = -1;

void setup() {
  size(640, 480);

  gedekteKaarten = genereerKaarten(eigenschappen);
  geschudKaarten = kaartenSchudden(gedekteKaarten);
  nGedekteKaarten = gedekteKaarten.length;
  for (int kaartOpen = 0; kaartOpen < openKaarten.length; kaartOpen++)
  {
    openKaarten[kaartOpen] = geschudKaarten[geschudKaarten.length - kaartOpen - 1];
    nGedekteKaarten = nGedekteKaarten - 1;
  }
}

void draw() {
  clear();
  tekenTafelDek();
  tekenMenu();

  for (int test = 0; test < 9; test++)
  {
    tekenKaart(openKaarten[test], test);
  }
  tekenStapelKaarten(nGedekteKaarten);
  if (nGeselecteerdePosities == 3)
  {
    String[] kandidaatset = kandidaatsetOmzetten(geselecteerdePosities);
    if (isSet(kandidaatset))
    {
      println("It's a set!");
      //nGedekteKaarten -= geselecteerdePosities.length;
      openKaarten = verwijderOpenKaarten(kandidaatset);
    } else
    {
      println("It's not a set!");
    }
    geselecteerdePosities = resetGeselecteerdePosities(geselecteerdePosities);
    nGeselecteerdePosities = 0;
  }
}