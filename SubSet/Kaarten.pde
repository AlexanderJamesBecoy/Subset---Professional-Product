String[] genereerKaarten(String[] kaarten_eigenschappen)
{
  int aantalKaarten = (int)pow(3, kaarten_eigenschappen.length);
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
        nieuweKaarten[kaartIndex] = aantalVorm + "" + kleurVorm + "" + soortVorm;
        kaartIndex++;
      }
    }
  }
  return nieuweKaarten;
}

String[] kaartenSchudden(String[] kaarten)
{
  String[] nieuweKaartenStapel = kaarten;
  for(int kaartenIndex = 0; kaartenIndex < kaarten.length; kaartenIndex++)
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
  return  kaartUitStapel;
}

boolean isSet(String[] kandidaatset)
{
  char[] aantal = new char[3];
  char[] kleur = new char[3];
  char[] vorm = new char[3];
  for(int kandidaatIndex = 0; kandidaatIndex < kandidaatset.length; kandidaatIndex++)
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
  for(int openKaartIndex = 0; openKaartIndex < openKaarten.length; openKaartIndex++)
  {
    for(int gekozenKaartIndex = 0; gekozenKaartIndex < gekozenKaarten.length; gekozenKaartIndex++)
    {
      if(gekozenPosities[gekozenKaartIndex] == openKaartIndex)
        gekozenKaarten[gekozenKaartIndex] = openKaarten[openKaartIndex];
    }
  }
  printArray(gekozenKaarten);
  return gekozenKaarten;
}

int[] resetGeselecteerdePosities(int[] geselecteerdePosities)
{
  int[] nieuweArray = new int[geselecteerdePosities.length];
  for(int arrayIndex = 0; arrayIndex < nieuweArray.length; arrayIndex++)
  {
    nieuweArray[arrayIndex] = -1;
  }
  return nieuweArray;
}

int aangekliktePositie()
{
  int bordpositie = -1;
  for(int kaartIndex = 0; kaartIndex < openKaarten.length; kaartIndex++)
  {
    float breedteMarge = MARGE * 4;
    float kaartX = MENUHOOGTE + (breedteMarge * ((kaartIndex % 3) + 1) + BREEDTEKAART * (kaartIndex % 3));
    float kaartY = MENUHOOGTE + (MARGE * ((kaartIndex / 3) + 1) + HOOGTEKAART * (kaartIndex / 3));
    if(muisBovenRect(kaartX, kaartY, BREEDTEKAART, HOOGTEKAART))
    {
      bordpositie = kaartIndex;
    }
  }
  return bordpositie;
}

int[] coordinatenBijBordpositie(int bordpositie)
{
  int[] nieuweCoordinaten = geselecteerdePosities;
  for(int bekijkPositie = 0; bekijkPositie < nieuweCoordinaten.length; bekijkPositie++)
  {
    if(nieuweCoordinaten[bekijkPositie] == bordpositie)
    {
      nieuweCoordinaten[bekijkPositie] = -1;
      nGeselecteerdePosities--;
      return nieuweCoordinaten; 
    }
  }
  for(int coordinaatIndex = 0; coordinaatIndex < geselecteerdePosities.length; coordinaatIndex++)
  {
    if(geselecteerdePosities[coordinaatIndex] == -1)
    {
      nieuweCoordinaten[coordinaatIndex] = bordpositie;
      nGeselecteerdePosities++;
      coordinaatIndex = geselecteerdePosities.length;
    }
  }
  return nieuweCoordinaten;
}