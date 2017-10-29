void tekenTafelDek() {
  background(kleur_tafelDek1);
  noStroke();
  fill(kleur_tafelDek2);
  rect(0, 0, MARGE * 4, height);
  rect(width, 0, -MARGE * 4, height);
}

void tekenMenu() {
  noStroke();
  fill(black);
  rect(0, 0, width, MENUHOOGTE);
  stroke(white);
  strokeWeight(2);
  int menuMarge = MARGE / 2;
  rect(menuMarge, menuMarge, width - MARGE, MENUHOOGTE - MARGE, menuMarge);
  pauzeKnop(MARGE * 2, MARGE * 2);
}

void tekenKaart(String kaart, int bordpositie) {
  float hoogteKaart = (height - MENUHOOGTE - MARGE * 5) / 3;
  float breedteKaart = hoogteKaart / 2;
  float breedteMarge = MARGE * 4;
  float kaartX = MENUHOOGTE;
  float kaartY = MENUHOOGTE;

  kaartX += breedteMarge * ((bordpositie % 3) + 1) + breedteKaart * (bordpositie % 3);
  kaartY += MARGE * ((bordpositie / 3) + 1) + hoogteKaart * (bordpositie / 3);
  
  float kaartenMarge = MARGE / 2;
  float figuurHoogte = ((hoogteKaart - MARGE) / 3) / 2;
  float figuurMarge = 0;
  int aantalFiguren = 0;
  stroke(black);
  strokeWeight(1);
  fill(white);
  rect(kaartX, kaartY, breedteKaart, hoogteKaart, MARGE / 2);
  noStroke();
  switch(kaart.charAt(0))
  {
  case '1':
    aantalFiguren = 1;
    figuurMarge = hoogteKaart / 2 - figuurHoogte / 2;
    break;
  case '2':
    aantalFiguren = 2;
    figuurMarge = hoogteKaart / 2 - figuurHoogte;
    break;
  case '3':
    aantalFiguren = 3;
    figuurMarge = hoogteKaart / 2 - figuurHoogte * 2;
    break;
  }
  switch(kaart.charAt(1))
  {
  case 'r':
    fill(red);
    break;
  case 'g':
    fill(green);
    break;
  case 'b':
    fill(blue);
    break;
  }
  for (int aantal = 0; aantal < aantalFiguren; aantal++)
  {
    switch(kaart.charAt(2))
    {
    case 'r':
      rect(kaartX + kaartenMarge, kaartY + figuurHoogte * aantal + MARGE * aantal + figuurMarge, breedteKaart - kaartenMarge * 2, figuurHoogte);
      break;
    case 'e':
      ellipse(kaartX + (breedteKaart / 2), kaartY + (figuurHoogte / 2) + + figuurHoogte * aantal + MARGE * aantal + figuurMarge, breedteKaart - MARGE, figuurHoogte);
      break;
    case 'd':
      driehoek(kaartX + kaartenMarge, kaartY + figuurHoogte * aantal + MARGE * aantal + figuurMarge, breedteKaart - kaartenMarge * 2, figuurHoogte);
      break;
    }
  }
  if (muisBovenRect(kaartX, kaartY, breedteKaart, hoogteKaart))
  {
    noFill();
    stroke(yellow);
    strokeWeight(2);
    rect(kaartX, kaartY, breedteKaart, hoogteKaart, MARGE / 2);
  }
}

void tekenStapelKaarten(int gedekteKaarten) {
  float hoogteKaart = (height - MENUHOOGTE - MARGE * 5) / 3;
  float breedteKaart = hoogteKaart / 2;
  float kaartX = width - MENUHOOGTE;
  float kaartY = MENUHOOGTE * 2;
  for(int gedekteKaart = 0; gedekteKaart < gedekteKaarten; gedekteKaart++)
  {
    stroke(black);
    strokeWeight(1);
    fill(#AAAAAA);
    rect(kaartX, kaartY, breedteKaart, hoogteKaart, MARGE / 2);
    noStroke();
    fill(#DDDDDD);
    rect(kaartX + MARGE / 2, kaartY + MARGE / 2, breedteKaart - MARGE, hoogteKaart - MARGE, MARGE / 2);
    kaartY -= 2;
  }
}

void driehoek(float xPositie, float yPositie, float breedte, float hoogte) {
  triangle(xPositie, yPositie + hoogte, xPositie + (breedte / 2), yPositie, xPositie + breedte, yPositie + hoogte);
}