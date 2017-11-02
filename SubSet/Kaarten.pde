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
  printArray(nieuweKaarten);
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

int nSetsOpTafel()
{
  int aantalMogelijkeSets = 0;
  if (scherm == 2)
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
              if (isSet(kaartenCombinaties))
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

void geefHint()
{
  geselecteerdePosities = resetGeselecteerdePosities(geselecteerdePosities);
  speler1_Score -= 5;
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
            if (isSet(kaartenCombinaties))
            {
              geselecteerdePosities[0] = kaart1;
              geselecteerdePosities[1] = kaart2;
              nGeselecteerdePosities = 2;
              hintGegeven = true;
            }
          }
        }
      }
    }
  }
}

boolean isSet(String[] kandidaatset)
{
  char[] aantal = new char[3];
  char[] kleur = new char[3];
  char[] vorm = new char[3];
  for (int kandidaatIndex = 0; kandidaatIndex < kandidaatset.length; kandidaatIndex++)
  {
    aantal[kandidaatIndex] = kandidaatset[kandidaatIndex].charAt(0);
    kleur[kandidaatIndex] = kandidaatset[kandidaatIndex].charAt(1);
    vorm[kandidaatIndex] = kandidaatset[kandidaatIndex].charAt(2);
  }
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
          nieuweOpenKaarten[kaartIndex] = "zzz";
        }
      }
    }
  }
  geselecteerdePosities = resetGeselecteerdePosities(geselecteerdePosities);
  return nieuweOpenKaarten;
}

int[] resetGeselecteerdePosities(int[] geselecteerdePosities)
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
    float kaartX = MENUHOOGTE + breedteMarge * (3 / kaartDeler);
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