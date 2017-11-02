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
  float menuBarHoogte = (MENUHOOGTE - menuMarge * 2) / 2;
  float menuBarBreedte = menuBarHoogte * 0.75;
  float knopHoogte = (MENUHOOGTE - MARGE * 3) / 2;
  float knopBreedte = knopHoogte * 4;
  float knopX = MARGE * 2;
  float knopY = MARGE + knopHoogte;
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
  float puntenWaardenX = schermBreedte - menuBarBreedte / 2 - menuMarge;
  textAlign(CENTER, CENTER);
  text(speler1_SetsGevonden, puntenWaardenX, menuMarge + menuBarHoogte / 2);
  text(speler1_Score, puntenWaardenX, menuMarge + menuBarHoogte + menuBarHoogte / 2);
  menuTekst(menuNotificatie, knopX + MARGE, knopX);
  pauzeKnop(knopX, knopY, knopBreedte, knopHoogte);
  hintKnop(knopX + MARGE + knopBreedte, knopY, knopBreedte, knopHoogte);
}

void menuTekst(String tekst, float xPositie, float yPositie)
{
  fill(WHITE);
  textSize(TEKSTGROOTTE_20);
  textAlign(LEFT, TOP);
  text(tekst, xPositie, yPositie);
}

void menuKnopAchtergrond(float xPositie, float yPositie, float knopBreedte, float knopHoogte)
{
  stroke(WHITE);
  strokeWeight(2);
  fill(BLACK);
  rect(xPositie, yPositie, knopBreedte, knopHoogte, MARGE / 2);
  fill(WHITE);
  textSize(TEKSTGROOTTE_16);
  textAlign(CENTER, CENTER);
}

void menuPauzeModal()
{
  float rectMarge = MARGE / 2;
  float rectBreedte = schermBreedte / 2;
  float rectHoogte = (schermHoogte - MENUHOOGTE) * 0.8;
  float rectX = rectBreedte - rectBreedte / 2;
  float rectY = MENUHOOGTE + rectMarge;
  float knopBreedte = rectBreedte - MARGE * 2;
  float knopHoogte = rectHoogte / 4;
  tekenModal("Pauze", rectX, rectY, rectBreedte, rectHoogte);
  tekenKnop("Verder spelen", schermBreedte / 2, rectY + knopHoogte + MARGE * 2, knopBreedte, knopHoogte);
  tekenKnop("Opnieuw spelen", schermBreedte / 2, rectY + knopHoogte * 2 + MARGE * 2, knopBreedte, knopHoogte);
  tekenKnop("Stoppen", schermBreedte / 2, rectY + knopHoogte * 3 + MARGE * 2, knopBreedte, knopHoogte);
}

void tekenKaart(String kaart, int bordpositie) {
  if (kaart.charAt(0) != 'z')
  {
    boolean vierEigenschappen = (kaart.length() == 4);
    int kaartDeler = openKaarten.length / 3;
    float breedteMarge = MARGE * 2 * ((bordpositie % kaartDeler) + 1);
    float kaartX = MENUHOOGTE * 0.75 + breedteMarge * (3 / kaartDeler);
    float kaartY = MENUHOOGTE;
    kaartX += breedteMarge + BREEDTEKAART * (bordpositie % kaartDeler);
    kaartY += MARGE * ((bordpositie / kaartDeler) + 1) + HOOGTEKAART * (bordpositie / kaartDeler);
    float kaartenMarge = MARGE / 2;
    float figuurBreedte = BREEDTEKAART - MARGE;
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
    fillOfNoFill(vierEigenschappen, kaart);
    for (int aantal = 0; aantal < aantalFiguren; aantal++)
    {
      switch(kaart.charAt(2))
      {
      case 'r':
        if (vierEigenschappen)
          gestreept(kaart.charAt(3), kaart.charAt(2), aantal, kaartX, kaartY, figuurBreedte, figuurHoogte, figuurMarge);
        rect(kaartX + kaartenMarge, kaartY + figuurHoogte * aantal + MARGE * aantal + figuurMarge, figuurBreedte, figuurHoogte);
        break;
      case 'e':
        if (vierEigenschappen)
          gestreept(kaart.charAt(3), kaart.charAt(2), aantal, kaartX, kaartY, figuurBreedte, figuurHoogte, figuurMarge);
        ellipse(kaartX + (BREEDTEKAART / 2), kaartY + (figuurHoogte / 2) + + figuurHoogte * aantal + MARGE * aantal + figuurMarge, figuurBreedte, figuurHoogte);
        break;
      case 'd':
        if (vierEigenschappen)
          gestreept(kaart.charAt(3), kaart.charAt(2), aantal, kaartX, kaartY, figuurBreedte, figuurHoogte, figuurMarge);
        driehoek(kaartX + kaartenMarge, kaartY + (figuurHoogte * aantal) + (MARGE * aantal) + figuurMarge, figuurBreedte, figuurHoogte);
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
    if(muisBovenRect(kaartX, kaartY - nGedekteKaarten * 2, BREEDTEKAART, HOOGTEKAART + 2 * nGedekteKaarten) && aanHetSpelen)
    {
      stroke(YELLOW);
      strokeWeight(4);
      noFill();
      rect(kaartX, kaartY - nGedekteKaarten * 2, BREEDTEKAART, HOOGTEKAART + 2 * nGedekteKaarten, MARGE / 2);
    }
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
  rect(xPositie, yPositie, modalBreedte, modalHoogte, rectMarge);
  stroke(WHITE);
  strokeWeight(2);
  rect(xPositie + rectMarge, yPositie + rectMarge, modalBreedte - MARGE, modalHoogte - MARGE, rectMarge);
  fill(WHITE);
  textSize(TEKSTGROOTTE_20);
  textAlign(CENTER, TOP);
  text(tekst, xPositie + modalBreedte / 2, yPositie + MARGE);
  line(xPositie + MARGE, yPositie + TEKSTGROOTTE_20 * 2, xPositie + modalBreedte - MARGE, yPositie + TEKSTGROOTTE_20 * 2);
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


void driehoek(float xPositie, float yPositie, float breedte, float hoogte)
{
  triangle(xPositie, yPositie + hoogte, xPositie + (breedte / 2), yPositie, xPositie + breedte, yPositie + hoogte);
}

void fillOfNoFill(boolean isSet, String kaart)
{
  strokeWeight(2);
  char vulling = 'v';
  if (isSet)
    vulling = kaart.charAt(3);
  switch(kaart.charAt(1))
  {
  case 'r':
    stroke(RED);
    bekijkVulling(RED, vulling);
    break;
  case 'g':
    stroke(GREEN);
    bekijkVulling(GREEN, vulling);
    break;
  case 'b':
    stroke(BLUE);
    bekijkVulling(BLUE, vulling);
    break;
  }
}

void bekijkVulling(color kleur, char vulling)
{
  if (vulling == 'v')
    fill(kleur);
  else
    noFill();
}

void gestreept(char vulling, char vorm, int aantal, float xPositie, float yPositie, float breedte, float hoogte, float figuurMarge)
{
  switch(vulling)
  {
  case 'r':
    maakStreepjes(vorm, xPositie + MARGE / 2, yPositie + hoogte * aantal + MARGE * aantal + figuurMarge, breedte, hoogte);
    break;
  case 'g':
    maakStreepjes(vorm, xPositie + MARGE / 2, yPositie + hoogte * aantal + MARGE * aantal + figuurMarge, breedte, hoogte);
    break;
  case 'b':
    maakStreepjes(vorm, xPositie + MARGE / 2, yPositie + hoogte * aantal + MARGE * aantal + figuurMarge, breedte, hoogte);
    break;
  }
}

void maakStreepjes(char vorm, float xPositie, float yPositie, float breedte, float hoogte)
{
  strokeWeight(2);
  noFill();
  float streepMarge = hoogte / 4.0;
  switch(vorm)
  {
  case 'r':
    for (int streep = 0; streep < 4; streep++)
    {
      line(xPositie, yPositie + streep * streepMarge + streepMarge, xPositie + breedte, yPositie + streep * streepMarge);
    }
    break;
  case 'e':
    for (int streep = 0; streep < 4; streep++)
    {
      if (streep == 2) line(xPositie + 2, yPositie + streep * streepMarge, xPositie + breedte - 2, yPositie + streep * streepMarge);
      else if (streep > 0) line(xPositie + 4, yPositie + streep * streepMarge, xPositie + breedte - 4, yPositie + streep * streepMarge);
    }        
    break;
  case 'd':
    float hoogteMarge = hoogte / 4.0;
    driehoek(xPositie + streepMarge * 3, yPositie + hoogteMarge, breedte - streepMarge * 6, hoogte - hoogteMarge * 2);
    break;
  }
}