String[] gedekteKaarten;
String[] geschudKaarten;
String[] openKaarten = new String[9];
int[] geselecteerdePosities = {-1, -1, -1};

String menuNotificatie;
int nGedekteKaarten;
int nGeselecteerdePosities = 0;
int muisOverKaart = -1;
boolean aanHetSpelen = false;
boolean hintGegeven = false;

int speler1_Score = 0;
int speler1_SetsGevonden = 0;
int speler2_Score = 0;
int speler2_SetsGevonden = 0;
boolean speler1Beurt = true;

void initieerSubSet_1P()
{
  aanHetSpelen = true;
  menuNotificatie = "";
  speler1_Score = 0;
  speler1_SetsGevonden = 0;
  speler2_Score = 0;
  speler2_SetsGevonden = 0;
  if (scherm == 2)
  {
    openKaarten = new String[9];
    gedekteKaarten = kaartenSchudden(genereerKaarten(eigenschappen, false));
  } else if (scherm == 4)
  {
    openKaarten = new String[12];
    gedekteKaarten = kaartenSchudden(genereerKaarten(eigenschappen, true));
  }
  while (nSetsOpTafel() == 0)
  {
    geschudKaarten = kaartenSchudden(gedekteKaarten);
    nGedekteKaarten = gedekteKaarten.length;
    for (int kaartOpen = 0; kaartOpen < openKaarten.length; kaartOpen++)
    {
      openKaarten[kaartOpen] = geschudKaarten[geschudKaarten.length - kaartOpen - 1];
      nGedekteKaarten = nGedekteKaarten - 1;
    }
  }
  printArray(openKaarten);
}

void speelSubSet_1P()
{
  tekenTafelDek();
  tekenMenu();
  tekenStapelKaarten(nGedekteKaarten);
  for (int kaartIndex = 0; kaartIndex < openKaarten.length; kaartIndex++)
  {
    tekenKaart(openKaarten[kaartIndex], kaartIndex);
  }
  if (nSetsOpTafel() > 0)
  {
    if (aanHetSpelen)
    {
      if (nGeselecteerdePosities == 3)
      {
        String[] kandidaatset = kandidaatsetOmzetten(geselecteerdePosities);
        if (isSet(kandidaatset))
        {
          speler1_SetsGevonden++;
          scoreBepalen(kandidaatset);
          openKaarten = verwijderOpenKaarten(kandidaatset);
          menuNotificatie = "SET!";
        } else
        {
          menuNotificatie = "Dat is geen set!";
        }
        hintGegeven = false;
        geselecteerdePosities = resetGeselecteerdePosities(geselecteerdePosities);
        nGeselecteerdePosities = 0;
      }
    } else
    {
      menuPauzeModal();
    }
  } else
  {
    if (nSetsOpTafel() == 0)
      menuNotificatie = "Er zijn geen sets meer over.";
    else
      menuNotificatie = "Game Over!";
    aanHetSpelen = false;
    spelGewonnen();
  }
}

/* Één-speler Set */
void initieerSet_1P()
{
  aanHetSpelen = true;
  menuNotificatie = "";
  speler1_Score = 0;
  speler1_SetsGevonden = 0;
  openKaarten = new String[12];
  gedekteKaarten = kaartenSchudden(genereerKaarten(eigenschappen, true));
  while (nSetsOpTafel() == 0)
  {
    geschudKaarten = kaartenSchudden(gedekteKaarten);
    nGedekteKaarten = gedekteKaarten.length;
    for (int kaartOpen = 0; kaartOpen < openKaarten.length; kaartOpen++)
    {
      openKaarten[kaartOpen] = geschudKaarten[geschudKaarten.length - kaartOpen - 1];
      nGedekteKaarten = nGedekteKaarten - 1;
    }
  }
  printArray(openKaarten);
}

void speelSet_1P()
{
  tekenTafelDek();
  tekenStapelKaarten(nGedekteKaarten);
  for (int kaartIndex = 0; kaartIndex < openKaarten.length; kaartIndex++)
  {
    tekenKaart(openKaarten[kaartIndex], kaartIndex);
  }
  /*
  if (nSetsOpTafel() > 0)
  {
    if (aanHetSpelen)
    {
      if (nGeselecteerdePosities == 3)
      {
        String[] kandidaatset = kandidaatsetOmzetten(geselecteerdePosities);
        if (isSet(kandidaatset))
        {
          speler1_SetsGevonden++;
          scoreBepalen(kandidaatset);
          openKaarten = verwijderOpenKaarten(kandidaatset);
          menuNotificatie = "SET!";
        } else
        {
          menuNotificatie = "Dat is geen set!";
        }
        hintGegeven = false;
        geselecteerdePosities = resetGeselecteerdePosities(geselecteerdePosities);
        nGeselecteerdePosities = 0;
      }
    } else
    {
      menuPauzeModal();
    }
  } else
  {
    if (nSetsOpTafel() == 0)
      menuNotificatie = "Er zijn geen sets meer over.";
    else
      menuNotificatie = "Game Over!";
    aanHetSpelen = false;
    spelGewonnen();
  }
  */
}

void spelGewonnen()
{
  float rectMarge = MARGE / 2;
  float rectBreedte = schermBreedte / 2;
  float rectHoogte = (schermHoogte - MENUHOOGTE) * 0.8;
  float rectX = rectBreedte - rectBreedte / 2;
  float rectY = MENUHOOGTE + rectMarge;
  String[] highscoreLijst = loadStrings("savefiles/highscoreSubset1P.txt");
  tekenModal("HIGHSCORE", "Terug naar het hoofdmenu", rectX, rectY, rectBreedte, rectHoogte);
  for (int highScore = 0; highScore < highscoreLijst.length; highScore++)
  {
    if (speler1_Score > float(highscoreLijst[highScore]))
      menuNotificatie = "Nieuwe highscore!";
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