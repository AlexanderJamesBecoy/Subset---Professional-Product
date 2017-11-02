void mouseClicked()
{
  // Scherm Menu
  if (scherm == 0)
  {
    if (hoverSpeel())
    {
      scherm = 2;
      initieerSubSet_1P();
    }
    if(hoverVerhaal())
    {
      scherm = 3;
    }
    if(hoverTutorial())
    {
      scherm = 4;
    }
    if (hoverStoppen())
    {
      exit();
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
    if(aanHetSpelen)
    {
      geselecteerdePosities = coordinatenBijBordpositie(aangekliktePositie());
      if(muisBovenRect(knopMenuX, knopMenuY, knopMenuBreedte, knopMenuHoogte))
        aanHetSpelen = false;
      else if(muisBovenRect(knopMenuX + MARGE + knopMenuBreedte, knopMenuY, knopMenuBreedte, knopMenuHoogte))
        geefHint();
    }
    else if(hoverTerug(knopStoppenX, knopStoppenY, knopStoppenBreedte, knopStoppenHoogte))
      aanHetSpelen = true;
  }
  
  // Scherm Verhaal of Scherm Tutorial
  else if(scherm == 3 || scherm == 4)
  {
    if(hoverTerug(schermBreedte / 2, schermHoogte * 0.8, MENU_KNOPBREEDTE, MENU_KNOPHOOGTE))
      scherm = 0;
  }
}