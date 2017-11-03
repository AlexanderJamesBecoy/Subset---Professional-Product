void mousePressed()
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
    if (nSetsOpTafel(vierEigenschappen) > 0)
    {
      if (aanHetSpelen)
      {
        geselecteerdePosities = coordinatenBijBordpositie(aangekliktePositie());
        if (hoverPauzeKnop())
          aanHetSpelen = false;
        else if (hoverHintKnop() && !hintGegeven)
        {
          if (scherm == 4)
            geefHint(true);
          else
            geefHint(false);
        } else if (hoverPakKaarten())
        {
          pakNieuweKaarten();
        }
      } else if (hoverVerderKnop())
        aanHetSpelen = true;
      else if (hoverOpnieuwKnop())
        initieerSubSet();
      else if (hoverStoppenKnop())
        scherm = 0;
    } else
    {
      if (hoverStoppenNaUitspelen())
        scherm = 0;
    }
  }

  // Scherm Verhaal of Scherm Tutorial
  else if (scherm == 5 || scherm == 6)
  {
    if (hoverTerug())
      scherm = 0;
  }
}