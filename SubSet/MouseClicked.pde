void mouseClicked()
{
  // Scherm Menu
  if (scherm == 0)
  {
    if (hoverMenuKnop1())
    {
      scherm = 1;
    } else if (hoverMenuKnop2())
    {
      scherm = 5;
    } else if (hoverMenuKnop3())
    {
      scherm = 6;
    } else if (hoverMenuKnop4())
    {
      exit();
    }
  }

  // Scherm Spelvarianten
  else if (scherm == 1)
  {
    if (hoverMenuKnop1() || hoverMenuKnop2() || hoverMenuKnop3())
    {
      if (hoverMenuKnop1()) scherm = 2;
      else if (hoverMenuKnop2()) scherm = 3;
      else if (hoverMenuKnop3()) scherm = 4;
      initieerSubSet();
    } else if (hoverMenuKnop4())
    {
      scherm = 0;
    }
  }

  // Scherm Game
  else if (scherm == 2 || scherm == 3 || scherm == 4)
  {
    boolean vierEigenschappen = false;
    if (scherm == 4)
      vierEigenschappen = true;
    float knopMenuHoogte = (MENUHOOGTE - MARGE * 3) / 2;
    float knopMenuBreedte = knopMenuHoogte * 4;
    float knopMenuX = MARGE * 2;
    float knopMenuY = MARGE + knopMenuHoogte;
    float modalHoogte = (schermHoogte - MENUHOOGTE) * 0.8;
    float knopStoppenBreedte = schermBreedte / 2;
    float knopStoppenHoogte = modalHoogte / 8;
    float knopX = knopStoppenBreedte;
    float knopStoppenY = ((MENUHOOGTE + MARGE / 2) + modalHoogte + MARGE * 2);
    float knopPauzeHoogte = knopStoppenHoogte * 2;
    float knopPauzeBreedte = knopStoppenBreedte - MARGE * 2;
    float knopPauzeY = (MENUHOOGTE + MARGE / 2) + knopPauzeHoogte + MARGE * 2;
    if (nSetsOpTafel(vierEigenschappen) > 0)
    {
      if (aanHetSpelen)
      {
        geselecteerdePosities = coordinatenBijBordpositie(aangekliktePositie());
        if (muisBovenRect(knopMenuX, knopMenuY, knopMenuBreedte, knopMenuHoogte))
          aanHetSpelen = false;
        else if (muisBovenRect(knopMenuX + MARGE + knopMenuBreedte, knopMenuY, knopMenuBreedte, knopMenuHoogte) && !hintGegeven)
          if (scherm == 4)
            geefHint(true);
          else
            geefHint(false);
      } else if (hoverSpelKnop(knopX, knopPauzeY, knopPauzeBreedte, knopPauzeHoogte))
        aanHetSpelen = true;
      else if (hoverSpelKnop(knopX, knopPauzeY + knopPauzeHoogte, knopPauzeBreedte, knopPauzeHoogte))
        initieerSubSet();
      else if (hoverSpelKnop(knopX, knopPauzeY + knopPauzeHoogte * 2, knopPauzeBreedte, knopPauzeHoogte))
        scherm = 0;
    } else
    {
      if (hoverSpelKnop(knopX, knopStoppenY, knopStoppenBreedte, knopStoppenHoogte))
        scherm = 0;
    }
  }

  // Scherm Verhaal of Scherm Tutorial
  else if (scherm == 5 || scherm == 6)
  {
    if (hoverSpelKnop(knoppen[4][0], knoppen[4][1], knoppen[4][2], knoppen[4][3]))
      scherm = 0;
  }
}