void setup() {
  
}

void draw() {
  if(scherm == 0)
    beeldMenu();
  
  if(scherm == 2)
    speelSubSet_1P();
  
  if(scherm == 3)
    beeldVerhaal();
  
  if(scherm == 4)
    beeldTutorial(); 
}