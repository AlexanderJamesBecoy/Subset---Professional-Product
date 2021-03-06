String[] genereerKaarten(String[] kaarten_eigenschappen, boolean isSet)
{
  int aantalKaarten = (int)pow(3, 3);
  if (isSet)
    aantalKaarten = (int)pow(3, kaarten_eigenschappen.length);
  String[] nieuweKaarten = new String[aantalKaarten];
  int kaartIndex = 0;
  for (int aantalIndex = 0; aantalIndex < 3; aantalIndex++)
  {
    for (int kleurIndex = 0; kleurIndex < 3; kleurIndex++)
    {
      for (int vormIndex = 0; vormIndex < 3; vormIndex++)
      {
        char aantalVorm = kaarten_eigenschappen[0].charAt(aantalIndex);
        char kleurVorm = kaarten_eigenschappen[1].charAt(kleurIndex);
        char soortVorm = kaarten_eigenschappen[2].charAt(vormIndex);
        if (isSet)
        {
          for (int vullingIndex = 0; vullingIndex < 3; vullingIndex++)
          {
            char vullingVorm = kaarten_eigenschappen[3].charAt(vullingIndex);
            nieuweKaarten[kaartIndex] = aantalVorm + "" + kleurVorm + "" + soortVorm + "" + vullingVorm;
            kaartIndex++;
          }
        } else
        {
          nieuweKaarten[kaartIndex] = aantalVorm + "" + kleurVorm + "" + soortVorm;
          kaartIndex++;
        }
      }
    }
  }
  return nieuweKaarten;
}

String[] kaartenSchudden(String[] kaarten)
{
  String[] nieuweKaartenStapel = kaarten;
  for (int kaartenIndex = 0; kaartenIndex < kaarten.length; kaartenIndex++)
  {
    String tijdelijkeLocatie = nieuweKaartenStapel[kaartenIndex];
    int willekeurigeIndex = floor(random(kaarten.length));
    nieuweKaartenStapel[kaartenIndex] = kaarten[willekeurigeIndex];
    nieuweKaartenStapel[willekeurigeIndex] = tijdelijkeLocatie;
  }
  return nieuweKaartenStapel;
}

String pakKaartVanStapel()
{
  String kaartUitStapel = gedekteKaarten[nGedekteKaarten - 1];
  return kaartUitStapel;
}

int nSetsOpTafel(boolean vierEigenschappen)
{
  int aantalMogelijkeSets = 0;
  for (int openKaartIndex_1 = 0; openKaartIndex_1 < openKaarten.length; openKaartIndex_1++)
  {
    String[] kaartenCombinaties = new String[3];
    kaartenCombinaties[0] = openKaarten[openKaartIndex_1];
    for (int openKaartIndex_2 = 0; openKaartIndex_2 < openKaarten.length; openKaartIndex_2++)
    {
      if (kaartenCombinaties[0] != openKaarten[openKaartIndex_2]) {
        kaartenCombinaties[1] = openKaarten[openKaartIndex_2];
        for (int openKaartIndex_3 = 0; openKaartIndex_3 < openKaarten.length; openKaartIndex_3++)
        {
          if (kaartenCombinaties[1] != openKaarten[openKaartIndex_3]) {
            kaartenCombinaties[2] = openKaarten[openKaartIndex_3];
            if (isSet(kaartenCombinaties, vierEigenschappen))
            {
              aantalMogelijkeSets++;
            }
          } else {
            openKaartIndex_3 = openKaarten.length;
          }
        }
      } else {
        openKaartIndex_2 = openKaarten.length;
      }
    }
  }
  return aantalMogelijkeSets;
}

void geefHint(boolean vierEigenschappen)
{
  geselecteerdePosities = resetGeselecteerdePosities();
  if (speler1Beurt)
    speler1_Score -= 5;
  else
    speler2_Score -= 5;
  for (int kaart1 = 0; kaart1 < openKaarten.length; kaart1++)
  {
    String[] kaartenCombinaties = new String[3];
    kaartenCombinaties[0] = openKaarten[kaart1];
    for (int kaart2 = 0; kaart2 < openKaarten.length; kaart2++)
    {
      if (openKaarten[kaart1] != openKaarten[kaart2])
      {
        kaartenCombinaties[1] = openKaarten[kaart2];
        for (int kaart3 = 0; kaart3 < openKaarten.length; kaart3++)
        {
          if (openKaarten[kaart2] != openKaarten[kaart3])
          {
            kaartenCombinaties[2] = openKaarten[kaart3];
            if (isSet(kaartenCombinaties, vierEigenschappen))
            {
              geselecteerdePosities[0] = kaart1;
              geselecteerdePosities[1] = kaart2;
              nGeselecteerdePosities = 2;
              menuNotificatie = "Hint gegeven! -5 punten.";
              hintGegeven = true;
            }
          }
        }
      }
    }
  }
}

boolean isSet(String[] kandidaatset, boolean vierEigenschappen)
{
  char[] aantal = new char[3];
  char[] kleur = new char[3];
  char[] vorm = new char[3];
  char[] vulling = new char[3];
  for (int kandidaatIndex = 0; kandidaatIndex < kandidaatset.length; kandidaatIndex++)
  {
    aantal[kandidaatIndex] = kandidaatset[kandidaatIndex].charAt(0);
    kleur[kandidaatIndex] = kandidaatset[kandidaatIndex].charAt(1);
    vorm[kandidaatIndex] = kandidaatset[kandidaatIndex].charAt(2);
    if (vierEigenschappen)
      vulling[kandidaatIndex] = kandidaatset[kandidaatIndex].charAt(3);
  }
  if (vierEigenschappen)
    return (bekijkVerschil(aantal[0], aantal[1], aantal[2]) && bekijkVerschil(kleur[0], kleur[1], kleur[2]) && bekijkVerschil(vorm[0], vorm[1], vorm[2]) && bekijkVerschil(vulling[0], vulling[1], vulling[2]));
  else
    return (bekijkVerschil(aantal[0], aantal[1], aantal[2]) && bekijkVerschil(kleur[0], kleur[1], kleur[2]) && bekijkVerschil(vorm[0], vorm[1], vorm[2]));
}

String[] kandidaatsetOmzetten(int[] gekozenPosities)
{
  String[] gekozenKaarten = new String[gekozenPosities.length];
  for (int openKaartIndex = 0; openKaartIndex < openKaarten.length; openKaartIndex++)
  {
    for (int gekozenKaartIndex = 0; gekozenKaartIndex < gekozenKaarten.length; gekozenKaartIndex++)
    {
      if (gekozenPosities[gekozenKaartIndex] == openKaartIndex)
        gekozenKaarten[gekozenKaartIndex] = openKaarten[openKaartIndex];
    }
  }
  return gekozenKaarten;
}

String[] verwijderOpenKaarten(String[] gekozenSet)
{
  String[] kandidaatset = gekozenSet;
  String[] nieuweOpenKaarten = openKaarten;
  if (((scherm == 2 || scherm == 3) && openKaarten.length == 12) || (scherm == 4 && openKaarten.length == 15))
  {
    nieuweOpenKaarten = openKaartenVerschuiven(nieuweOpenKaarten, gekozenSet);
  } else {
    for (int kaartIndex = 0; kaartIndex < openKaarten.length; kaartIndex++)
    {
      for (int kandidaatIndex = 0; kandidaatIndex < kandidaatset.length; kandidaatIndex++)
      {
        if (nieuweOpenKaarten[kaartIndex] == kandidaatset[kandidaatIndex])
        {
          if (nGedekteKaarten > 0)
          {
            nieuweOpenKaarten[kaartIndex] = gedekteKaarten[nGedekteKaarten - 1];
            nGedekteKaarten--;
          } else
          {
            nieuweOpenKaarten[kaartIndex] = "zzzz";
          }
        }
      }
    }
  }
  geselecteerdePosities = resetGeselecteerdePosities();
  return nieuweOpenKaarten;
}

String[] openKaartenVerschuiven(String[] kaarten, String[] gekozenSet)
{
  String[] verschovenKaarten = new String[kaarten.length - 3];
  int index = 0;
  for (int kaart = 0; kaart < kaarten.length; kaart++)
  {
    if (kaarten[kaart] != gekozenSet[0] && kaarten[kaart] != gekozenSet[1] && kaarten[kaart] != gekozenSet[2])
    {
      verschovenKaarten[index] = openKaarten[kaart];
      index++;
    }
  }
  openKaarten = new String[verschovenKaarten.length];
  return verschovenKaarten;
}

void pakNieuweKaarten()
{
  if (((scherm == 2 || scherm == 3) && openKaarten.length < 12) || (scherm == 4 && openKaarten.length < 15))
  {
    for (int kaart = 0; kaart < 3; kaart++)
    {
      openKaarten = append(openKaarten, gedekteKaarten[nGedekteKaarten - 1]);
      nGedekteKaarten--;
    }
  }
  if(speler1Beurt)
    speler1_Score -= 3;
  else
    speler2_Score -= 3;
}

int[] resetGeselecteerdePosities()
{
  int[] nieuweArray = new int[geselecteerdePosities.length];
  for (int arrayIndex = 0; arrayIndex < nieuweArray.length; arrayIndex++)
  {
    nieuweArray[arrayIndex] = -1;
  }
  return nieuweArray;
}

int aangekliktePositie()
{
  int bordpositie = -1;
  for (int kaartIndex = 0; kaartIndex < openKaarten.length; kaartIndex++)
  {
    int kaartDeler = openKaarten.length / 3;
    float breedteMarge = MARGE * 2 * ((kaartIndex % kaartDeler) + 1);
    float kaartX = MENUHOOGTE * 0.75 + breedteMarge * (3 / kaartDeler);
    float kaartY = MENUHOOGTE;
    kaartX += breedteMarge + BREEDTEKAART * (kaartIndex % kaartDeler);
    kaartY += MARGE * ((kaartIndex / kaartDeler) + 1) + HOOGTEKAART * (kaartIndex / kaartDeler);
    if (muisBovenRect(kaartX, kaartY, BREEDTEKAART, HOOGTEKAART))
    {
      bordpositie = kaartIndex;
    }
  }
  return bordpositie;
}

int[] coordinatenBijBordpositie(int bordpositie)
{
  int[] nieuweCoordinaten = geselecteerdePosities;
  if (bordpositie == -1)
  {
    return nieuweCoordinaten;
  }
  for (int bekijkPositie = 0; bekijkPositie < nieuweCoordinaten.length; bekijkPositie++)
  {
    if (nieuweCoordinaten[bekijkPositie] == bordpositie)
    {
      nieuweCoordinaten[bekijkPositie] = -1;
      if (nGeselecteerdePosities > 0) nGeselecteerdePosities--;
      return nieuweCoordinaten;
    }
  }
  for (int coordinaatIndex = 0; coordinaatIndex < geselecteerdePosities.length; coordinaatIndex++)
  {
    if (geselecteerdePosities[coordinaatIndex] == -1)
    {
      nieuweCoordinaten[coordinaatIndex] = bordpositie;
      nGeselecteerdePosities++;
      coordinaatIndex = geselecteerdePosities.length;
    }
  }
  return nieuweCoordinaten;
}