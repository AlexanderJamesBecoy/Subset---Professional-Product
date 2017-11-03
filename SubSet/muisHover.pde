boolean hoverMenuKnop1()
{
  float knopX = knoppenMenu[0][0] - knoppenMenu[0][2] / 2;
  float knopY = knoppenMenu[0][1] - knoppenMenu[0][3] / 2;
  return muisBovenRect(knopX, knopY, knoppenMenu[0][2], knoppenMenu[0][3]);
}

boolean hoverMenuKnop2()
{
  float knopX = knoppenMenu[1][0] - knoppenMenu[1][2] / 2;
  float knopY = knoppenMenu[1][1] - knoppenMenu[1][3] / 2;
  return muisBovenRect(knopX, knopY, knoppenMenu[1][2], knoppenMenu[1][3]);
}

boolean hoverMenuKnop3()
{
  float knopX = knoppenMenu[2][0] - knoppenMenu[2][2] / 2;
  float knopY = knoppenMenu[2][1] - knoppenMenu[2][3] / 2;
  return muisBovenRect(knopX, knopY, knoppenMenu[2][2], knoppenMenu[2][3]);
}

boolean hoverMenuKnop4()
{
  float knopX = knoppenMenu[3][0] - knoppenMenu[3][2] / 2;
  float knopY = knoppenMenu[3][1] - knoppenMenu[3][3] / 2;
  return muisBovenRect(knopX, knopY, knoppenMenu[3][2], knoppenMenu[3][3]);
}

boolean hoverPauzeKnop()
{
  return muisBovenRect(knoppenSpel[0][0], knoppenSpel[0][1], knoppenSpel[0][2], knoppenSpel[0][3]);
}

boolean hoverHintKnop()
{
  return muisBovenRect(knoppenSpel[1][0], knoppenSpel[1][1], knoppenSpel[1][2], knoppenSpel[1][3]);
}

boolean hoverVerderKnop()
{
  float xPositie = knoppenSpel[2][0] - knoppenSpel[2][2] / 2;
  float yPositie = knoppenSpel[2][1] - knoppenSpel[2][3] / 3;
  return muisBovenRect(xPositie, yPositie, knoppenSpel[2][2], knoppenSpel[2][3]);
}

boolean hoverOpnieuwKnop()
{
  float xPositie = knoppenSpel[2][0] - knoppenSpel[2][2] / 2;
  float yPositie = knoppenSpel[2][1] - knoppenSpel[2][3] / 3 + MARGE;
  return muisBovenRect(xPositie, yPositie + knoppenSpel[2][3], knoppenSpel[2][2], knoppenSpel[2][3]);
}

boolean hoverStoppenKnop()
{
  float xPositie = knoppenSpel[2][0] - knoppenSpel[2][2] / 2;
  float yPositie = knoppenSpel[2][1] - knoppenSpel[2][3] / 3 + MARGE * 2;
  return muisBovenRect(xPositie, yPositie + knoppenSpel[2][3] * 2, knoppenSpel[2][2], knoppenSpel[2][3]);
}

boolean hoverPakKaarten()
{
  return muisBovenRect(knoppenSpel[4][0], knoppenSpel[4][1] - 2 * nGedekteKaarten, knoppenSpel[4][2], knoppenSpel[4][3] + 2 * nGedekteKaarten) && nGedekteKaarten > 0;
}

boolean hoverStoppenNaUitspelen()
{
  float xPositie = knoppenSpel[3][0] - knoppenSpel[3][2] / 2;
  float yPositie = knoppenSpel[3][1] - knoppenSpel[3][3] / 2;
  return muisBovenRect(xPositie, yPositie, knoppenSpel[3][2], knoppenSpel[3][3]);
}

boolean hoverTerug()
{
  float xPositie = knoppenMenu[4][0] - knoppenMenu[4][2] / 2;
  float yPositie = knoppenMenu[4][1] - knoppenMenu[4][3] / 2;
  return muisBovenRect(xPositie, yPositie, knoppenMenu[4][2], knoppenMenu[4][3]);
}