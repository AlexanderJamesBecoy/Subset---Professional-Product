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
  
  /* Speel Één-speler SubSet */
  if(scherm == 2)
    speelSubSet_1P();
    
  /* Speel Twee-speler SubSet */
  if(scherm == 3)
    speelSubSet_1P();
    
  /* Speel Één-speler Set */
  if(scherm == 4)
    speelSet_1P();
  
  /* Bekijk verhaal achter het spel */
  if(scherm == 5)
    beeldVerhaal();
  
  /* Bekijk tutorial */
  if(scherm == 6)
    beeldTutorial(); 
}