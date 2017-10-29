String[] eigenschappen = {"123", "rgb", "red"};

final int MARGE = 10;
final int MENUHOOGTE = 128;

color black = #000000;
color red = #FF0000;
color yellow = #FFFF00;
color green = #00FF00;
color blue = #0000FF;
color white = #FFFFFF;
color kleur_tafelDek1 = #4F7942;
color kleur_tafelDek2 = #556B2F;

void pauzeKnop(float xPositie, float yPositie)
{
  stroke(white);
  strokeWeight(2);
  fill(black);
  float knopLengte = (MENUHOOGTE - MARGE * 4) / 2;
  rect(xPositie, yPositie, knopLengte, knopLengte, MARGE / 2);
  fill(white);
  float pauzeKolomBreedte = knopLengte / 10;
  float pauzeKolomMarge = MARGE * 2;
  rect(xPositie + pauzeKolomMarge, yPositie + MARGE, pauzeKolomBreedte, knopLengte - pauzeKolomMarge);
  rect(xPositie + knopLengte - pauzeKolomMarge, yPositie + MARGE, pauzeKolomBreedte, knopLengte - pauzeKolomMarge);
  if(muisBovenRect(xPositie, yPositie, knopLengte, knopLengte))
  {
    noFill();
    stroke(yellow);
    strokeWeight(2);
    rect(xPositie, yPositie, knopLengte, knopLengte, MARGE / 2);
  }
}