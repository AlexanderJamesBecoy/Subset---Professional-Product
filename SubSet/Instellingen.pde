String[] eigenschappen = {"123", "rgb", "red"};
int schermBreedte = 800;
int schermHoogte = 600;
final float MARGE = 0.015625 * schermBreedte;
final float MENUHOOGTE = 0.26666666666 * schermHoogte;

void settings()
{
  size(schermBreedte, schermHoogte);
}

final float TEKSTGROOTTE_12 = 0.01875 * schermBreedte;
final float TEKSTGROOTTE_16 = 0.025 * schermBreedte;
final float TEKSTGROOTTE_20 = 0.03125 * schermBreedte;
final float TEKSTGROOTTE_TITEL = 0.225 * schermHoogte;

final float HOOGTEKAART = (schermHoogte - MENUHOOGTE - MARGE * 5) / 3;
final float BREEDTEKAART = HOOGTEKAART / 2;
final float MENU_KNOPBREEDTE = schermBreedte / 3;
final float MENU_KNOPHOOGTE = schermHoogte / 10;

final color BLACK = #000000;
final color GREY = #BBBBBB;
final color RED = #FF0000;
final color YELLOW = #FFFF00;
final color GREEN = #00FF00;
final color BLUE = #0000FF;
final color WHITE = #FFFFFF;
final color kleur_tafelDek1 = #4F7942;
final color kleur_tafelDek2 = #556B2F;

void pauzeKnop(float xPositie, float yPositie, float knopLengte)
{
  stroke(WHITE);
  strokeWeight(2);
  fill(BLACK);
  float rectBreedte = knopLengte * 4;
  rect(xPositie, yPositie, rectBreedte, knopLengte, MARGE / 2);
  fill(WHITE);
  if (muisBovenRect(xPositie, yPositie, rectBreedte, knopLengte))
  {
    noFill();
    stroke(YELLOW);
    strokeWeight(2);
    rect(xPositie, yPositie, rectBreedte, knopLengte, MARGE / 2);
    fill(YELLOW);
  }
  textSize(TEKSTGROOTTE_16);
  textAlign(CENTER, CENTER);
  text("Spel pauzeren", xPositie + rectBreedte / 2, yPositie + knopLengte / 2);
}

void hintKnop(float xPositie, float yPositie, float knopLengte)
{
  stroke(WHITE);
  strokeWeight(2);
  fill(BLACK);
  float rectBreedte = knopLengte * 4;
  rect(xPositie, yPositie, rectBreedte, knopLengte, MARGE / 2);
  fill(WHITE);
  if (muisBovenRect(xPositie, yPositie, rectBreedte, knopLengte))
  {
    noFill();
    stroke(YELLOW);
    strokeWeight(2);
    rect(xPositie, yPositie, rectBreedte, knopLengte, MARGE / 2);
    fill(YELLOW);
  }
  textSize(TEKSTGROOTTE_16);
  textAlign(CENTER, CENTER);
  text("Geef me een hint", xPositie + rectBreedte / 2, yPositie + knopLengte / 2);
}

void definieerKnop(String soortKnop, float xPositie, float yPositie, float knopBreedte, float knopHoogte)
{
  tekenKnop(soortKnop, xPositie, yPositie, knopBreedte, knopHoogte);
}