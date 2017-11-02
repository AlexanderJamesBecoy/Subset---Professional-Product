/*============================
scherm 0 = Main Menu
scherm 1 = Spelvariant kiezen
scherm 2 = Spelen
scherm 3 = Verhaal
scherm 4 = Tutorial
============================*/
int scherm = 0;

String[] stringKnoppen = {"Speel", "\"Behind The Game\"", "Hoe Speel Je?", "Stoppen", "Terug", "Één-speler Subset", "Twee-speler Subset", "Één-speler Set", "Terug"};
float[][] knoppen = {
  {schermBreedte / 2, schermHoogte / 2, MENU_KNOPBREEDTE, MENU_KNOPHOOGTE},
  {schermBreedte / 2, schermHoogte / 2 + MARGE + MENU_KNOPHOOGTE, MENU_KNOPBREEDTE, MENU_KNOPHOOGTE},
  {schermBreedte / 2, schermHoogte / 2 + MARGE * 2 + MENU_KNOPHOOGTE * 2, MENU_KNOPBREEDTE, MENU_KNOPHOOGTE},
  {schermBreedte / 2, schermHoogte / 2 + MARGE * 3 + MENU_KNOPHOOGTE * 3, MENU_KNOPBREEDTE, MENU_KNOPHOOGTE},
  {schermBreedte / 2, schermHoogte * 0.8, schermBreedte / 3, schermHoogte / 10}
};

void beeldMenu()
{
  tekenTafelDek();
  textSize(TEKSTGROOTTE_TITEL);
  textAlign(CENTER, CENTER);
  fill(WHITE);
  text("SubSet", schermBreedte / 2, MENUHOOGTE);
  for(int knopIndex = 0; knopIndex < 4; knopIndex++)
  {
    tekenKnop(stringKnoppen[knopIndex], knoppen[knopIndex][0], knoppen[knopIndex][1], knoppen[knopIndex][2], knoppen[knopIndex][3]);
  }
}

void beeldSpelVarianten()
{
  tekenTafelDek();
  textSize(TEKSTGROOTTE_48);
  textAlign(CENTER, CENTER);
  fill(WHITE);
  text("Kies een spelvariant", schermBreedte / 2, MENUHOOGTE);
  for(int knopIndex = 0; knopIndex < 4; knopIndex++)
  {
    tekenKnop(stringKnoppen[knopIndex + 5], knoppen[knopIndex][0], knoppen[knopIndex][1], knoppen[knopIndex][2], knoppen[knopIndex][3]);
  }
}

void beeldVerhaal()
{
  String[] verhaalLijnen = loadStrings("savefiles/verhaal.txt");
  tekenTafelDek();
  textSize(TEKSTGROOTTE_20);
  textAlign(CENTER, CENTER);
  fill(WHITE);
  for(int verhaalLijnIndex = 0; verhaalLijnIndex < verhaalLijnen.length; verhaalLijnIndex++)
  {
    text(verhaalLijnen[verhaalLijnIndex], schermBreedte / 2, MENUHOOGTE + TEKSTGROOTTE_20 * verhaalLijnIndex);
  }
  tekenKnop("Terug", knoppen[4][0], knoppen[4][1], knoppen[4][2], knoppen[4][3]);
}

void beeldTutorial()
{
  String[] verhaalLijnen = loadStrings("savefiles/tutorial.txt");
  tekenTafelDek();
  textSize(TEKSTGROOTTE_20);
  textAlign(CENTER, CENTER);
  fill(WHITE);
  for(int verhaalLijnIndex = 0; verhaalLijnIndex < verhaalLijnen.length; verhaalLijnIndex++)
  {
    text(verhaalLijnen[verhaalLijnIndex], schermBreedte / 2, 40 + TEKSTGROOTTE_20 * verhaalLijnIndex);
  }
  tekenKnop("Terug", knoppen[4][0], knoppen[4][1], knoppen[4][2], knoppen[4][3]);
}