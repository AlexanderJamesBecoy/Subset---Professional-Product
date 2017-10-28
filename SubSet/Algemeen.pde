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