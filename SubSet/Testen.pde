void keyPressed()
{
  if (key == 'a')
  {
    nGedekteKaarten = 0;
  }
  if (key == 's')
  {
    openKaarten = new String[12];
    gedekteKaarten = kaartenSchudden(genereerKaarten(eigenschappen, false));
    while (nSetsOpTafel(false) == 0)
    {
      geschudKaarten = kaartenSchudden(gedekteKaarten);
      nGedekteKaarten = gedekteKaarten.length;
      for (int kaartOpen = 0; kaartOpen < openKaarten.length; kaartOpen++)
      {
        openKaarten[kaartOpen] = geschudKaarten[geschudKaarten.length - kaartOpen - 1];
        nGedekteKaarten = nGedekteKaarten - 1;
      }
    }
  }
  if (key == 'd')
  {
    openKaarten = new String[9];
    gedekteKaarten = kaartenSchudden(genereerKaarten(eigenschappen, false));
    while (nSetsOpTafel(false) == 0)
    {
      geschudKaarten = kaartenSchudden(gedekteKaarten);
      nGedekteKaarten = gedekteKaarten.length;
      for (int kaartOpen = 0; kaartOpen < openKaarten.length; kaartOpen++)
      {
        openKaarten[kaartOpen] = geschudKaarten[geschudKaarten.length - kaartOpen - 1];
        nGedekteKaarten = nGedekteKaarten - 1;
      }
    }
  }
  if(key == 'w' && nGedekteKaarten > 0)
  {
    pakNieuweKaarten();
  }
}