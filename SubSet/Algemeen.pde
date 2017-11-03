boolean muisBovenRect(float xPositie, float yPositie, float breedte, float hoogte)
{
  return (mouseX >= xPositie && mouseX <= xPositie + breedte && mouseY >= yPositie && mouseY <= yPositie + hoogte);
}

boolean muisBovenCirkel(float xPositie, float yPositie, float diameter)
{
  float straal = diameter / 2;
  float aanliggende = (xPositie - mouseX);
  float overstaande = (yPositie - mouseY);
  float afstand = sqrt(sq(overstaande) + sq(aanliggende));
  return afstand <= straal;
}

boolean bekijkHetzelfde(char kaart1, char kaart2, char kaart3)
{
  return (kaart1 == kaart2 && kaart2 == kaart3 && kaart1 == kaart3);
}

boolean bekijkVerschil(char kaart1, char kaart2, char kaart3)
{
  if (kaart1 == 'z' || kaart2 == 'z' || kaart3 == 'z')
    return false;
  else
    return (kaart1 != kaart2 && kaart2 != kaart3 && kaart1 != kaart3) || bekijkHetzelfde(kaart1, kaart2, kaart3);
}

void scoreBepalen(String[] kandidaatset)
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
  int nieuweScore = 9;
  if (bekijkHetzelfde(aantal[0], aantal[1], aantal[2]))
  {
    nieuweScore = nieuweScore - 3;
  }
  if (bekijkHetzelfde(kleur[0], kleur[1], kleur[2]))
  {
    nieuweScore = nieuweScore - 3;
  }
  if (bekijkHetzelfde(vorm[0], vorm[1], vorm[2]))
  {
    nieuweScore = nieuweScore - 3;
  }
  if (speler1Beurt)
    speler1_Score += nieuweScore;
  else
    speler2_Score += nieuweScore;
}

void beurtWisselen()
{
  if (speler1Beurt)
    menuNotificatie = "Speler 2 is aan de beurt.";
  else
    menuNotificatie = "Speler 1 is aan de beurt.";
  speler1Beurt = !speler1Beurt;
}