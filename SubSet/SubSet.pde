void settings()
{
  size(schermBreedte, schermHoogte);
}

void draw()
{
  if(scherm == HOOFDMENU)
    beeldMenu();
    
  /* Kies spelvariant */
  if(scherm == SPELVARIANTEN)
    beeldSpelVarianten();
  
  /* Spelvarianten spelen */
  if(scherm == EENSPELERSUBSET || scherm == TWEESPELERSSUBSET || scherm == EENSPELERSET)
    speelSubSet();
  
  /* Bekijk verhaal achter het spel */
  if(scherm == VERHAAL)
    beeldVerhaal();
  
  /* Bekijk tutorial */
  if(scherm == TUTORIAL)
    beeldTutorial(); 
}