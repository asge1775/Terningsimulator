int diceCount = 100;      //Number of dice
int diceSides = 6;        //Number of sides on dice
int grafWidth = 500;      //width of the sumarry graf

color textcolor = color(255,255,0);    //color of text

int chartWidth;
chartWidth = width - grafWidth;    //width of dice representation graf

color[] colors = new int[diceSides];
int[] count = new int[diceSides];

size (2000,1000);
background(0);
textSize(12);

for(int i = 0; i<diceSides; i++){
  colors[i] = color(255 / diceSides * i);    //greyscale colors of dice-graf
}

  
  
//---------dice graf-------------
for(int i = 0; i<diceCount; i++){
  
  int rand = int(random(0,diceSides));    //roll dice
  
  fill(colors[rand]);                     //sets color of grayscale graf
  rect(i * (chartWidth / diceCount),      //x position of colum
       0,                                 //sets graf at the top
       chartWidth / diceCount,            //width of colum dependen on number of dice
       height / diceSides * (rand + 1));  //height of colum dependent on number of dice sides
    
  count[rand]++;                          //remembers dice roll
    
  fill(textcolor);                        //sets color of text
  text(rand + 1, i * (chartWidth / diceCount) + chartWidth / diceCount / 2,20); //writes roll on top of colum
}
  
//-----------summary graf----------
for(int i = 0; i<diceSides; i++){
  fill(255);      //color of graf
  rect(chartWidth + i * (grafWidth / diceSides),    //x position of graf after the last graf
       0,                                           //y position
       grafWidth / diceSides,                       //width of graf
       count[i] * (height / diceCount));            //lenght of graf dependent on number of rolls
       
  fill(0);        //color of text
  text(str(i + 1) + ": " + str(count[i]),chartWidth + i * (grafWidth / diceSides),10 );  //writes side of dice and number of hits
}
