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
    float rectX = schermBreedte / 2;
    float rectY = schermHoogte;
    float rectBreedte = schermBreedte / 2;
    float rectHoogte = (schermHoogte - MENUHOOGTE) * 0.8;
    if(aanHetSpelen)
    {
      geselecteerdePosities = coordinatenBijBordpositie(aangekliktePositie());
      if(muisBovenRect(MARGE * 2, MARGE * 2, (MENUHOOGTE - MARGE * 3) / 2 * 4, (MENUHOOGTE - MARGE * 4) / 2))
        aanHetSpelen = false;
    }
    else if(hoverTerug(rectX, rectY, rectBreedte, rectHoogte))
      scherm = 0;
  }
  
  // Scherm Verhaal of Scherm Tutorial
  else if(scherm == 3 || scherm == 4)
  {
    if(hoverTerug(schermBreedte / 2, schermHoogte * 0.8, MENU_KNOPBREEDTE, MENU_KNOPHOOGTE))
      scherm = 0;
  }
}