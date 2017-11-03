String[] gedekteKaarten;
String[] geschudKaarten;
String[] openKaarten;
int[] geselecteerdePosities = {-1, -1, -1};

String menuNotificatie;
int nGedekteKaarten;
int nGeselecteerdePosities = 0;
int muisOverKaart = -1;
boolean aanHetSpelen = false;
boolean hintGegeven = false;

int speler1_SetsGevonden = 0;
int speler2_SetsGevonden = 0;
int speler1_Score = 0;
int speler2_Score = 0;
boolean speler1Beurt = true;

void initieerSubSet()
{
  aanHetSpelen = true;
  hintGegeven = false;
  menuNotificatie = "";
  speler1_SetsGevonden = 0;
  speler1_Score = 0;
  speler2_Score = 0;
  geselecteerdePosities = resetGeselecteerdePosities();
  boolean vierEigenschappen = false;
  if (scherm == 2 || scherm == 3)
  {
    openKaarten = new String[9];
    gedekteKaarten = kaartenSchudden(genereerKaarten(eigenschappen, false));
    if (scherm == 3)
      menuNotificatie = "Player 1 is aan de beurt.";
  } else if (scherm == 4)
  {
    openKaarten = new String[12];
    gedekteKaarten = kaartenSchudden(genereerKaarten(eigenschappen, true));
    vierEigenschappen = true;
  }
  while (nSetsOpTafel(vierEigenschappen) == 0)
  {
    geschudKaarten = kaartenSchudden(gedekteKaarten);
    nGedekteKaarten = gedekteKaarten.length;
    for (int kaartOpen = 0; kaartOpen < openKaarten.length; kaartOpen++)
    {
      openKaarten[kaartOpen] = geschudKaarten[geschudKaarten.length - kaartOpen - 1];
      nGedekteKaarten = nGedekteKaarten - 1;
    }
  }
}

void speelSubSet()
{
  tekenTafelDek();
  tekenMenu();
  tekenStapelKaarten(nGedekteKaarten);
  boolean vierEigenschappen = false;
  if (scherm == 4)
    vierEigenschappen = true;
  for (int kaartIndex = 0; kaartIndex < openKaarten.length; kaartIndex++)
  {
    tekenKaart(openKaarten[kaartIndex], kaartIndex);
  }
  if (nSetsOpTafel(vierEigenschappen) > 0)
  {
    if (aanHetSpelen)
    {
      if (nGeselecteerdePosities == 3)
      {
        String[] kandidaatset = kandidaatsetOmzetten(geselecteerdePosities);
        if (isSet(kandidaatset, false))
        {
          speler1_SetsGevonden++;
          scoreBepalen(kandidaatset);
          openKaarten = verwijderOpenKaarten(kandidaatset);
          menuNotificatie = "SET!";
          if (scherm == 3)
          {
            beurtWisselen();
          }
        } else
        {
          if (scherm == 3)
            beurtWisselen();
          menuNotificatie = "Dat is geen set!";
        }
        hintGegeven = false;
        geselecteerdePosities = resetGeselecteerdePosities();
        nGeselecteerdePosities = 0;
      }
    } else
    {
      menuPauzeModal();
    }
  } else
  {
    if (nSetsOpTafel(vierEigenschappen) == 0)
      menuNotificatie = "Er zijn geen sets meer over.";
    else
      menuNotificatie = "Game Over!";
    aanHetSpelen = false;
    spelGewonnen();
  }
}

void spelGewonnen()
{
  float rectMarge = MARGE / 2;
  float rectBreedte = schermBreedte / 2;
  float rectX = rectBreedte - rectBreedte / 2;
  float rectY = MENUHOOGTE + rectMarge;
  tekenModal("UITKOMST", rectX, rectY, rectBreedte, MODALHOOGTE);
  fill(WHITE);
  textSize(TEKSTGROOTTE_16);
  float textX = rectX + MARGE * 4;
  if (scherm == 2 || scherm == 4)
  {
    textAlign(LEFT, TOP);
    text("Je hebt " + speler1_SetsGevonden + " sets gevonden", textX, rectY + TEKSTGROOTTE_16 * 6);
    text("en een score van " + speler1_Score, textX, rectY + TEKSTGROOTTE_16 * 8);
  } else
  {
    String winner = "Speler 1 wint!";
    if (speler2_Score == speler1_Score)
      winner = "Gelijk spel!";
    else if (speler2_Score > speler1_Score)
      winner = "Speler 2 wint!";
    textAlign(CENTER, TOP);
    text(winner, schermBreedte / 2, rectY + TEKSTGROOTTE_16 * 4);
    textAlign(LEFT, TOP);
    text("Speler 1 heeft " + speler1_SetsGevonden + " sets gevonden", textX, rectY + TEKSTGROOTTE_16 * 6);
    text("en een score van " + speler1_Score, textX, rectY + TEKSTGROOTTE_16 * 8);
    text("Speler 2 heeft " + speler2_SetsGevonden + " sets gevonden", textX, rectY + TEKSTGROOTTE_16 * 12);
    text("en een score van " + speler2_Score, textX, rectY + TEKSTGROOTTE_16 * 14);
  }
  tekenKnop("Terug naar het hoofdmenu", schermBreedte / 2, rectY + MODALHOOGTE + MARGE * 2, rectBreedte, MODALHOOGTE / 8);
}