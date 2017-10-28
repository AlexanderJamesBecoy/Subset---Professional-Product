String[] genereerKaarten(String[] eigenschappen)
{
  int aantalKaarten = (int)pow(3, 3);
  /*
  if(isSubSet){
    aantalKaarten = (int)pow(3, 3);
  } else {
    aantalKaarten = (int)pow(3, 4);
  }
  */
  String[] nieuweKaarten = new String[aantalKaarten];
  for(int kaart = 0; kaart < aantalKaarten; kaart++) {
    for(int aantalIndex = 0; aantalIndex < 3; aantalIndex++) {
      for(int kleurIndex = 0; kleurIndex < 3; kleurIndex++) {
        for(int vormIndex = 0; vormIndex < 3; vormIndex++) {
          char aantalVorm = eigenschappen[0].charAt(aantalIndex);
          char kleurVorm = eigenschappen[1].charAt(kleurIndex);
          char soortVorm = eigenschappen[2].charAt(vormIndex);
          /*
          if(isSubSet) {
            nieuweKaarten[kaart] = aantalVorm + "" + kleurVorm + "" + soortVorm;
          } else {
            for(int vullingIndex = 0; vullingIndex < 3; vullingIndex++) {
              char vullingVorm = eigenschappen[3].charAt(vormIndex);
              nieuweKaarten[kaart] = aantalVorm + "" + kleurVorm + "" + soortVorm + "" + vullingVorm;
            }
          }
          */
        }
      }
    }
  }
  return nieuweKaarten;
}