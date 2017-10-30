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
  float breedteMarge = MARGE * 4;
  float kaartX = MENUHOOGTE;
  float kaartY = MENUHOOGTE;
  kaartX += breedteMarge * ((bordpositie % 3) + 1) + BREEDTEKAART * (bordpositie % 3);
  kaartY += MARGE * ((bordpositie / 3) + 1) + HOOGTEKAART * (bordpositie / 3);
  float kaartenMarge = MARGE / 2;
  float figuurHoogte = ((HOOGTEKAART - MARGE) / 3) / 2;
  float figuurMarge = 0;
  int aantalFiguren = 0;
  if (kaart != "zzz")
  {
    stroke(black);
    strokeWeight(1);
    fill(white);
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
      stroke(red);
      fill(red);
      break;
    case 'g':
      stroke(green);
      fill(green);
      break;
    case 'b':
      stroke(blue);
      fill(blue);
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
    if (muisBovenRect(kaartX, kaartY, BREEDTEKAART, HOOGTEKAART))
    {
      noFill();
      stroke(yellow);
      strokeWeight(2);
      rect(kaartX, kaartY, BREEDTEKAART, HOOGTEKAART, kaartenMarge);
    }
    for (int bekijkGeklikt = 0; bekijkGeklikt < geselecteerdePosities.length; bekijkGeklikt++)
    {
      if (geselecteerdePosities[bekijkGeklikt] == bordpositie)
      {
        noFill();
        stroke(yellow);
        strokeWeight(2);
        rect(kaartX - kaartenMarge, kaartY - kaartenMarge, BREEDTEKAART + MARGE, HOOGTEKAART + MARGE, kaartenMarge);
        bekijkGeklikt = geselecteerdePosities.length;
      }
    }
  }
}

void tekenStapelKaarten(int nGedekteKaarten) {

  float kaartX = width - MENUHOOGTE;
  float kaartY = MENUHOOGTE * 2;
  if (nGedekteKaarten > 0)
  {
    for (int gedekteKaart = 0; gedekteKaart < nGedekteKaarten; gedekteKaart++)
    {
      stroke(black);
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
    stroke(gray);
    strokeWeight(2);
    noFill();
    kaartY = MENUHOOGTE * 2;
    rect(kaartX, kaartY, BREEDTEKAART, HOOGTEKAART, MARGE / 2);
  }
  fill(black);
  textSize(12);
  textAlign(CENTER);
  text(nGedekteKaarten, kaartX + BREEDTEKAART / 2, kaartY + HOOGTEKAART);
}

void driehoek(float xPositie, float yPositie, float breedte, float hoogte) {
  triangle(xPositie, yPositie + hoogte, xPositie + (breedte / 2), yPositie, xPositie + breedte, yPositie + hoogte);
}

void tekenBord()
{
}