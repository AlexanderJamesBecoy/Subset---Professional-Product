boolean hoverMenuKnop1()
{
  float knopX = knoppen[0][0] - knoppen[0][2] / 2;
  float knopY = knoppen[0][1] - knoppen[0][3] / 2;
  return muisBovenRect(knopX, knopY, knoppen[0][2], knoppen[0][3]);
}

boolean hoverMenuKnop2()
{
  float knopX = knoppen[1][0] - knoppen[1][2] / 2;
  float knopY = knoppen[1][1] - knoppen[1][3] / 2;
  return muisBovenRect(knopX, knopY, knoppen[1][2], knoppen[1][3]);
}

boolean hoverMenuKnop3()
{
  float knopX = knoppen[2][0] - knoppen[2][2] / 2;
  float knopY = knoppen[2][1] - knoppen[2][3] / 2;
  return muisBovenRect(knopX, knopY, knoppen[2][2], knoppen[2][3]);
}

boolean hoverMenuKnop4()
{
  float knopX = knoppen[3][0] - knoppen[3][2] / 2;
  float knopY = knoppen[3][1] - knoppen[3][3] / 2;
  return muisBovenRect(knopX, knopY, knoppen[3][2], knoppen[3][3]);
}

boolean hoverTerug(float xPositie, float yPositie, float knopBreedte, float knopHoogte)
{
  xPositie = xPositie - knopBreedte / 2;
  yPositie = yPositie - knopHoogte / 2;
  return muisBovenRect(xPositie, yPositie, knopBreedte, knopHoogte);
}