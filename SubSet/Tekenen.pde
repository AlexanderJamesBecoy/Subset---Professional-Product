void tekenTafelDek() {
  clear();
  background(kleur_tafelDek1);
  noStroke();
  fill(kleur_tafelDek2);
  rect(0, 0, MARGE * 4, schermHoogte);
  rect(schermBreedte, 0, -MARGE * 4, schermHoogte);
}

void tekenMenu() {
  noStroke();
  fill(BLACK);
  rect(0, 0, schermBreedte, MENUHOOGTE);
  stroke(WHITE);
  strokeWeight(2);
  float menuMarge = MARGE / 2;
  rect(menuMarge, menuMarge, schermBreedte - MARGE, MENUHOOGTE - MARGE, menuMarge);
  float menuBarBreedte = (schermBreedte - menuMarge * 2) / 8;
  float menuBarHoogte = (MENUHOOGTE - menuMarge * 2) / 2;
  float knopLengte = (MENUHOOGTE - MARGE * 3) / 2;
  String[] menuBarStrings = {"Sets gevonden", "Score"};
  textSize(TEKSTGROOTTE_16);
  for (int menuBarIndex = 0; menuBarIndex < menuBarStrings.length; menuBarIndex++)
  {
    noFill();
    rect(schermBreedte - menuMarge, menuMarge + menuBarHoogte * menuBarIndex, -menuBarBreedte, menuBarHoogte, menuMarge);
    fill(WHITE);
    textAlign(RIGHT, CENTER);
    text(menuBarStrings[menuBarIndex], schermBreedte - menuMarge * 2 - menuBarBreedte, menuMarge + menuBarHoogte * menuBarIndex + menuBarHoogte / 2);
  }
  textAlign(CENTER, CENTER);
  text(setsGevonden, schermBreedte - menuBarBreedte / 2, menuMarge + menuBarHoogte / 2);
  text(score, schermBreedte - menuBarBreedte / 2, menuMarge + menuBarHoogte + menuBarHoogte / 2);
  pauzeKnop(MARGE * 2, MARGE + menuMarge, knopLengte);
  hintKnop(MARGE * 2, MARGE + menuMarge * 2 + knopLengte, knopLengte);
  menuTekst(menuNotificatie, schermBreedte / 2, MENUHOOGTE / 2);
}

void menuTekst(String tekst, float xPositie, float yPositie)
{
  fill(WHITE);
  textSize(TEKSTGROOTTE_20);
  textAlign(CENTER, CENTER);
  text(tekst, xPositie, yPositie);
}

void menuPauze()
{
  float rectMarge = MARGE / 2;
  float rectBreedte = schermBreedte / 2;
  float rectHoogte = (schermHoogte - MENUHOOGTE) * 0.8;
  float rectX = rectBreedte - rectBreedte / 2;
  float rectY = MENUHOOGTE + rectMarge;
  tekenModal("Pauze", rectX, rectY, rectBreedte, rectHoogte);
}

void tekenKaart(String kaart, int bordpositie) {
  if (kaart != "zzz")
  {
    float breedteMarge = MARGE * 4;
    float kaartX = MENUHOOGTE;
    float kaartY = MENUHOOGTE;
    kaartX += breedteMarge * ((bordpositie % 3) + 1) + BREEDTEKAART * (bordpositie % 3);
    kaartY += MARGE * ((bordpositie / 3) + 1) + HOOGTEKAART * (bordpositie / 3);
    float kaartenMarge = MARGE / 2;
    float figuurHoogte = ((HOOGTEKAART - MARGE) / 3) / 2;
    float figuurMarge = 0;
    int aantalFiguren = 0;
    stroke(BLACK);
    strokeWeight(1);
    fill(WHITE);
    rect(kaartX, kaartY, BREEDTEKAART, HOOGTEKAART, kaartenMarge);
    switch(kaart.charAt(0))
    {
    case '1':
      aantalFiguren = 1;
      figuurMarge = HOOGTEKAART / 2 - figuurHoogte / 2;
      break;
    case '2':
      aantalFiguren = 2;
      figuurMarge = HOOGTEKAART / 2 - figuurHoogte;
      break;
    case '3':
      aantalFiguren = 3;
      figuurMarge = HOOGTEKAART / 2 - figuurHoogte * 2;
      break;
    }
    switch(kaart.charAt(1))
    {
    case 'r':
      stroke(RED);
      fill(RED);
      break;
    case 'g':
      stroke(GREEN);
      fill(GREEN);
      break;
    case 'b':
      stroke(BLUE);
      fill(BLUE);
      break;
    }
    strokeWeight(2);
    for (int aantal = 0; aantal < aantalFiguren; aantal++)
    {
      switch(kaart.charAt(2))
      {
      case 'r':
        rect(kaartX + kaartenMarge, kaartY + figuurHoogte * aantal + MARGE * aantal + figuurMarge, BREEDTEKAART - kaartenMarge * 2, figuurHoogte);
        break;
      case 'e':
        ellipse(kaartX + (BREEDTEKAART / 2), kaartY + (figuurHoogte / 2) + + figuurHoogte * aantal + MARGE * aantal + figuurMarge, BREEDTEKAART - MARGE, figuurHoogte);
        break;
      case 'd':
        driehoek(kaartX + kaartenMarge, kaartY + figuurHoogte * aantal + MARGE * aantal + figuurMarge, BREEDTEKAART - kaartenMarge * 2, figuurHoogte);
        break;
      }
    }
    if (muisBovenRect(kaartX, kaartY, BREEDTEKAART, HOOGTEKAART) && aanHetSpelen)
    {
      noFill();
      stroke(YELLOW);
      strokeWeight(2);
      rect(kaartX, kaartY, BREEDTEKAART, HOOGTEKAART, kaartenMarge);
    }
    for (int bekijkGeklikt = 0; bekijkGeklikt < geselecteerdePosities.length; bekijkGeklikt++)
    {
      if (geselecteerdePosities[bekijkGeklikt] == bordpositie)
      {
        noFill();
        stroke(YELLOW);
        strokeWeight(2);
        rect(kaartX - kaartenMarge, kaartY - kaartenMarge, BREEDTEKAART + MARGE, HOOGTEKAART + MARGE, kaartenMarge);
        bekijkGeklikt = geselecteerdePosities.length;
      }
    }
  }
}

void tekenStapelKaarten(int nGedekteKaarten) {

  float kaartX = schermBreedte / 4 * 3;
  float kaartY = schermHoogte / 2;
  noStroke();
  fill(kleur_tafelDek2);
  rect(kaartX, kaartY + HOOGTEKAART, BREEDTEKAART, 2 * nGedekteKaarten);
  fill(BLACK);
  textSize(TEKSTGROOTTE_20);
  textAlign(CENTER);
  text(nGedekteKaarten, kaartX + BREEDTEKAART / 2, kaartY + HOOGTEKAART + TEKSTGROOTTE_20);
  if (nGedekteKaarten > 0)
  {
    for (int gedekteKaart = 0; gedekteKaart < nGedekteKaarten; gedekteKaart++)
    {
      stroke(BLACK);
      strokeWeight(1);
      fill(#AAAAAA);
      rect(kaartX, kaartY, BREEDTEKAART, HOOGTEKAART, MARGE / 2);
      noStroke();
      fill(#DDDDDD);
      rect(kaartX + MARGE / 2, kaartY + MARGE / 2, BREEDTEKAART - MARGE, HOOGTEKAART - MARGE, MARGE / 2);
      kaartY -= 2;
    }
  } else
  {
    stroke(GREY);
    strokeWeight(2);
    noFill();
    kaartY = schermHoogte / 2;
    rect(kaartX, kaartY, BREEDTEKAART, HOOGTEKAART, MARGE / 2);
  }
}

void tekenModal(String tekst, float xPositie, float yPositie, float modalBreedte, float modalHoogte)
{
  noStroke();
  fill(BLACK);
  float rectMarge = MARGE / 2;
  /*
  float rectBreedte = schermBreedte / 2;
   float rectHoogte = (schermHoogte - MENUHOOGTE) * 0.8;
   float rectX = rectBreedte - rectBreedte / 2;
   float rectY = MENUHOOGTE + rectMarge;*/
  rect(xPositie, yPositie, modalBreedte, modalHoogte, rectMarge);
  stroke(WHITE);
  strokeWeight(2);
  rect(xPositie + rectMarge, yPositie + rectMarge, modalBreedte - MARGE, modalHoogte - MARGE, rectMarge);
  fill(WHITE);
  textSize(TEKSTGROOTTE_20);
  textAlign(CENTER, TOP);
  text(tekst, xPositie + modalBreedte / 2, yPositie + MARGE);
  line(xPositie + MARGE, yPositie + TEKSTGROOTTE_20 * 2, xPositie + modalBreedte - MARGE, yPositie + TEKSTGROOTTE_20 * 2);
  float terugKnopHoogte = modalHoogte / 8;
  definieerKnop("Terug", schermBreedte / 2, schermHoogte - terugKnopHoogte, modalBreedte, terugKnopHoogte);
}

void driehoek(float xPositie, float yPositie, float breedte, float hoogte) {
  triangle(xPositie, yPositie + hoogte, xPositie + (breedte / 2), yPositie, xPositie + breedte, yPositie + hoogte);
}

void tekenKnop(String knopTekst, float xPositie, float yPositie, float knopBreedte, float knopHoogte)
{
  noStroke();
  fill(BLACK);
  float rectMarge = MARGE / 2;
  rect(xPositie - knopBreedte / 2, yPositie - knopHoogte / 2, knopBreedte, knopHoogte, rectMarge);
  textSize(20);
  textAlign(CENTER, CENTER);
  if (muisBovenRect(xPositie - knopBreedte / 2, yPositie - knopHoogte / 2, knopBreedte, knopHoogte))
  {
    fill(YELLOW);
    stroke(YELLOW);
  } else
  {
    fill(WHITE);
    stroke(WHITE);
  }
  text(knopTekst, xPositie, yPositie);
  noFill();
  strokeWeight(2);
  rect(xPositie - knopBreedte / 2 + rectMarge, yPositie - knopHoogte / 2 + rectMarge, knopBreedte - MARGE, knopHoogte - MARGE, rectMarge);
}