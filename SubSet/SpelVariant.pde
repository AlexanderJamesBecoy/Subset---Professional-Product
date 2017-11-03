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

int setsGevonden = 0;
int speler1_Score = 0;
int speler2_Score = 0;
boolean speler1Beurt = true;

void initieerSubSet()
{
  aanHetSpelen = true;
  menuNotificatie = "";
  setsGevonden = 0;
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
          setsGevonden++;
          scoreBepalen(kandidaatset);
          openKaarten = verwijderOpenKaarten(kandidaatset);
          menuNotificatie = "SET!";
          if (scherm == 3)
          {
            if (hintGegeven)
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
  if(scherm == 2 || scherm == 4)
  {
    String file = "savefiles/highscoreSubset.txt";
    if(scherm == 4)
      file = "savefiles/highscoreSet.txt";
    String[] highscoreLijst = loadStrings(file);
    tekenModal("HIGHSCORE", rectX, rectY, rectBreedte, MODALHOOGTE);
    for (int highScore = 0; highScore < highscoreLijst.length; highScore++)
    {
      if (speler1_Score > float(highscoreLijst[highScore]))
      {
        menuNotificatie = "Nieuwe highscore!";
        highscoreLijst = newHighscore(highscoreLijst, speler1_Score);
        saveStrings(file, highscoreLijst);
      }
    }
    for (int highscoreIndex = 0; highscoreIndex < highscoreLijst.length; highscoreIndex++)
    {
      fill(WHITE);
      textSize(TEKSTGROOTTE_16);
      textAlign(RIGHT, TOP);
      text((highscoreIndex + 1) + ". ", rectX + rectMarge + rectBreedte / 5, rectY + TEKSTGROOTTE_16 * (highscoreIndex + 3));
      text(highscoreLijst[highscoreIndex], rectX + rectMarge + rectBreedte / 3, rectY + TEKSTGROOTTE_16 * (highscoreIndex + 3));
    }
  }
  else
  {
    tekenModal("UITKOMST", rectX, rectY, rectBreedte, MODALHOOGTE);
    String winner = "Speler 1 wint!";
    if(speler2_Score == speler1_Score)
      winner = "Gelijk spel!";
    else if(speler2_Score > speler1_Score)
      winner = "Speler 2 wint!";
    text(winner, rectX, rectY + MODALHOOGTE / 2, rectBreedte, MODALHOOGTE);
  }
  tekenKnop("Terug naar het hoofdmenu", schermBreedte / 2, rectY + MODALHOOGTE + MARGE * 2, rectBreedte, MODALHOOGTE / 8);
}

String[] newHighscore(String[] oudeHighscore, int newScore)
{
  String[] newHighscore = new String[oudeHighscore.length];
  int[] oudeHighscoreInFloat = int(oudeHighscore);
  int tempWaarde = 0;
  boolean gescoord = false;
  for(int scoreIndex = 0; scoreIndex < oudeHighscoreInFloat.length; scoreIndex++)
  {
    if(!gescoord)
    {
      if(newScore > oudeHighscoreInFloat[scoreIndex])
      {
        tempWaarde = oudeHighscoreInFloat[scoreIndex];
        oudeHighscoreInFloat[scoreIndex] = newScore;
        gescoord = true;
      }
    } else
    {
      oudeHighscoreInFloat[scoreIndex] = tempWaarde;
      tempWaarde = oudeHighscoreInFloat[scoreIndex];
    }
  }
  for(int stringIndex = 0; stringIndex < newHighscore.length; stringIndex++)
  {
    newHighscore[stringIndex] = "" + oudeHighscoreInFloat[stringIndex] + "";
  }
  return newHighscore;
}