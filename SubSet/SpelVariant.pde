String[] gedekteKaarten;
String[] geschudKaarten;
String[] openKaarten = new String[9];
int[] geselecteerdePosities = {-1, -1, -1};
String menuNotificatie;
int nGedekteKaarten;
int nGeselecteerdePosities = 0;
int muisOverKaart = -1;

/*==============================
 SPELVARIANT - Één-speler SubSet
 ==============================*/
int score = 0;
int setsGevonden = 0;
boolean aanHetSpelen = false;

void initieerSubSet_1P()
{
  aanHetSpelen = true;
  menuNotificatie = "";
  score = 0;
  setsGevonden = 0;
  gedekteKaarten = kaartenSchudden(genereerKaarten(eigenschappen));
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
}

void speelSubSet_1P()
{
  tekenTafelDek();
  tekenMenu();
  tekenStapelKaarten(nGedekteKaarten);
  for (int kaartIndex = 0; kaartIndex < 9; kaartIndex++)
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
          setsGevonden++;
          scoreBepalen(kandidaatset);
          openKaarten = verwijderOpenKaarten(kandidaatset);
          menuNotificatie = "SET!";
        } else
        {
          menuNotificatie = "Dat is geen set!";
        }
        geselecteerdePosities = resetGeselecteerdePosities(geselecteerdePosities);
        nGeselecteerdePosities = 0;
      }
    } else
    {
      menuPauze();
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

void spelGewonnen()
{
  float rectMarge = MARGE / 2;
  float rectBreedte = schermBreedte / 2;
  float rectHoogte = (schermHoogte - MENUHOOGTE) * 0.8;
  float rectX = rectBreedte - rectBreedte / 2;
  float rectY = MENUHOOGTE + rectMarge;
  String[] highscoreLijst = loadStrings("savefiles/highscoreSubset1P.txt");
  tekenModal("HIGHSCORE", "Terug naar het hoofdmenu", rectX, rectY, rectBreedte, rectHoogte);
  for(int highScore = 0; highScore < highscoreLijst.length; highScore++)
  {
    if(score > float(highscoreLijst[highScore]))
      menuNotificatie = "Nieuwe highscore!";
  }
  for(int highscoreIndex = 0; highscoreIndex < highscoreLijst.length; highscoreIndex++)
  {
    fill(WHITE);
    textSize(TEKSTGROOTTE_16);
    textAlign(RIGHT, TOP);
    text((highscoreIndex + 1) + ". ", rectX + rectMarge + rectBreedte / 5, rectY + TEKSTGROOTTE_16 * (highscoreIndex + 3));
    text(highscoreLijst[highscoreIndex], rectX + rectMarge + rectBreedte / 3, rectY + TEKSTGROOTTE_16 * (highscoreIndex + 3));
  }
}