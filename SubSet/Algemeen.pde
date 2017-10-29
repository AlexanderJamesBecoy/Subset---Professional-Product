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
  String[] nieuweKaartenStapel = new String[kaarten.length];
  int[] gebruikteKaartenIndex = new int[kaarten.length];
  int randomIndex;
  int randomKaartenIndex;
  for (int kaartenIndex = 0; kaartenIndex < kaarten.length; kaartenIndex++)
  {
    randomIndex = floor(random(0, kaarten.length));
    while(randomIndex == gebruikteKaartenStapel[randomKaartenIndex])
    {
      
    }
    gebruikteKaartenIndex[kaartenIndex] = randomIndex;
    nieuweKaartenStapel[kaartenIndex] = kaarten[randomIndex];
  }
  println("Test:");
  printArray(gebruikteKaartenIndex);
  return nieuweKaartenStapel;
}

boolean muisBovenRect(float xPositie, float yPositie, float breedte, float hoogte) {
  return (mouseX >= xPositie && mouseX <= xPositie + breedte && mouseY >= yPositie && mouseY <= yPositie + hoogte);
}

boolean muisBovenCirkel(float xPositie, float yPositie, float diameter) {
  float straal = diameter / 2;
  float aanliggende = (xPositie - mouseX);
  float overstaande = (yPositie - mouseY);
  float afstand = sqrt(sq(overstaande) + sq(aanliggende));
  return afstand <= straal;
}