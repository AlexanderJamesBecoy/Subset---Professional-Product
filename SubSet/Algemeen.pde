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

boolean bekijkVerschil(char kaart1, char kaart2, char kaart3)
{
  return (kaart1 != kaart2 && kaart2 != kaart3 && kaart1 != kaart3) || (kaart1 == kaart2 && kaart2 == kaart3 && kaart1 == kaart3);
}