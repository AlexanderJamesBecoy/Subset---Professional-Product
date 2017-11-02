void mouseClicked()
{
  // Scherm Menu
  if (scherm == 0)
  {
    if (hoverMenuKnop1())
    {
      scherm = 1;
      //initieerSubSet_1P();
    }
    if(hoverMenuKnop2())
    {
      scherm = 5;
    }
    if(hoverMenuKnop3())
    {
      scherm = 6;
    }
    if (hoverMenuKnop4())
    {
      exit();
    }
  }
  
  // Scherm Spelvarianten
  else if (scherm == 1)
  {
    if (hoverMenuKnop1())
    {
      scherm = 2;
      initieerSubSet_1P();
    }
    else if (hoverMenuKnop3())
    {
      scherm = 4;
      initieerSet_1P();
    }
    else if (hoverMenuKnop4())
    {
      scherm = 0;
    }
  }
  
  // Scherm Game
  else if (scherm == 2)
  {
    float knopMenuHoogte = (MENUHOOGTE - MARGE * 3) / 2;
    float knopMenuBreedte = knopMenuHoogte * 4;
    float knopMenuX = MARGE * 2;
    float knopMenuY = MARGE + knopMenuHoogte;
    float knopStoppenBreedte = schermBreedte / 2;
    float knopStoppenHoogte = (schermHoogte - MENUHOOGTE) * 0.8;
    float knopStoppenX = schermBreedte / 2;
    float knopStoppenY = schermHoogte;
    if(nSetsOpTafel() > 0)
    {
      if(aanHetSpelen)
      {
        geselecteerdePosities = coordinatenBijBordpositie(aangekliktePositie());
        if(muisBovenRect(knopMenuX, knopMenuY, knopMenuBreedte, knopMenuHoogte))
          aanHetSpelen = false;
        else if(muisBovenRect(knopMenuX + MARGE + knopMenuBreedte, knopMenuY, knopMenuBreedte, knopMenuHoogte) && !hintGegeven)
          geefHint();
      }
      else if(hoverTerug(knopStoppenX, knopStoppenY, knopStoppenBreedte, knopStoppenHoogte))
        aanHetSpelen = true;
    }
    else
    {
      if(hoverTerug(knopStoppenX, knopStoppenY, knopStoppenBreedte, knopStoppenHoogte))
        scherm = 0;
    }
  }
  
  // Scherm Verhaal of Scherm Tutorial
  else if(scherm == 5 || scherm == 6)
  {
    if(hoverTerug(knoppen[4][0], knoppen[4][1], knoppen[4][2], knoppen[4][3]))
      scherm = 0;
  }
}