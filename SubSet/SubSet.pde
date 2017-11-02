void settings()
{
  size(schermBreedte, schermHoogte);
}

void draw()
{
  /* Hoofdmenu */
  if(scherm == 0)
    beeldMenu();
    
  /* Kies spelvariant */
  if(scherm == 1)
    beeldSpelVarianten();
  
  /* Spelvarianten spelen */
  if(scherm == 2 || scherm == 3 || scherm == 4)
    speelSubSet();
  
  /* Bekijk verhaal achter het spel */
  if(scherm == 5)
    beeldVerhaal();
  
  /* Bekijk tutorial */
  if(scherm == 6)
    beeldTutorial(); 
}