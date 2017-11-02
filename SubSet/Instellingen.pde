String[] eigenschappen = {"123", "rgb", "red", "lgv"};
int schermBreedte = 800;
int schermHoogte = 600;
final float MARGE = 0.015625 * schermBreedte;
final float MENUHOOGTE = 0.26666666666 * schermHoogte;

final float TEKSTGROOTTE_12 = 0.01875 * schermBreedte;
final float TEKSTGROOTTE_16 = 0.025 * schermBreedte;
final float TEKSTGROOTTE_20 = 0.03125 * schermBreedte;
final float TEKSTGROOTTE_48 = 0.075 * schermBreedte;
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

void pauzeKnop(float xPositie, float yPositie, float knopBreedte, float knopHoogte)
{
  menuKnopAchtergrond(xPositie, yPositie, knopBreedte, knopHoogte);
  if (muisBovenRect(xPositie, yPositie, knopBreedte, knopHoogte) && aanHetSpelen)
  {
    noFill();
    stroke(YELLOW);
    strokeWeight(2);
    rect(xPositie, yPositie, knopBreedte, knopHoogte, MARGE / 2);
    fill(YELLOW);
  }
  text("Spel pauzeren", xPositie + knopBreedte / 2, yPositie + knopHoogte / 2);
}

void hintKnop(float xPositie, float yPositie, float knopBreedte, float knopHoogte)
{
  menuKnopAchtergrond(xPositie, yPositie, knopBreedte, knopHoogte);
  if ((muisBovenRect(xPositie, yPositie, knopBreedte, knopHoogte) || hintGegeven) && aanHetSpelen)
  {
    noFill();
    stroke(YELLOW);
    strokeWeight(2);
    rect(xPositie, yPositie, knopBreedte, knopHoogte, MARGE / 2);
    fill(YELLOW);
  }
  text("Geef me een hint", xPositie + knopBreedte / 2, yPositie + knopHoogte / 2);
}