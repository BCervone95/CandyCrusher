
/*Hester van de Ven   en     Benedetta Cervone
 s2000156           en       s1443887  */
/*End Assignment Programming and Physical computing:
 "The Candy Crusher"
 We made a musical instrument that not only plays music, but also let's you play the game Candycrush. This way we hope to attract children's interest in learning how to play a musical instrument.
 The insturment consists of a piano-like part made out of capsenses, a drum-like part made out of cap senses and some special sound effects using LDRs.
 The theme of the game is very consistent in our creation since we not only implemented real life candy into it, but we also used sounds and sound effects from the game itself.
 The game can be played by pressing the gummy bears whatever order you'd like and by pressing the marshmellows to create a bass and snare sound. For the sound effects you have to cover the liquorice allsorts.
 To top it al off we added some gummy bears that light up when you play the piano part and the colours of the LEDs match the colors of the gummy bears that you play on.
 It's not only an interesting and interactive concept, it is also very enjoyable for all ages.
 
 Video and audio samples taken from Candy Crush the game.*/

import processing.serial.*;                                                                              //importing serial communication
import processing.sound.*;                                                                               //importing sound libray
import processing.video.*;                                                                               //importing video library

Serial myPort;                                                                                           //creating serial variable
Movie myMovie;                                                                                           //creating movie object

boolean playing = false;                                                                                 //declaring boolean for playing a sound
boolean [] press = new boolean[12];                                                                      //making arrays of booleans if object is pressed

PImage [] texts = new PImage[3];                                                                         //declare array text images
SoundFile[] melody = new SoundFile[12];                                                                  //declare array keyboard sounds

ArrayList <Movie> movies = new ArrayList <Movie>();                                                      //an arraylist in which movieobjects are loaded

int counter = 0;                                                                                         //declaring counter variable counting the steps of the videos
int gummyval = 0;


void setup() {
  size (1200, 700);                                                                          
  int numvid=18;                                                                                         //variable for total amount of video fragments
  myPort = new Serial(this, Serial.list()[1], 9600);
  myPort.bufferUntil('\n');                                                                              //buffers until new line

  for (int i=0; i<press.length; i++) {
    press[i] = false;
  }                                                                                                      //loop to count all press booleans and load all sounds
  for (int i=0; i<melody.length; i++) {
    melody[i] = new SoundFile(this, "sound"+i+".mp3");
  }                                                                                                      //loop to count all press booleans and load all sounds


  for (int i=0; i<texts.length; i++) {
    texts[i] = loadImage("text "+i+".png");
  }                                                                                                      //loop to load all the text images

  for (int i=0; i<numvid; i++) {
    myMovie = new Movie(this, "Candy Crush "+i+".mp4");
    movies.add(myMovie);                                                                                 //loop to load all the available fragment
  }

  playVideo();                                                                                           //plays video fragment
}


void draw() {
  int textX=500;                                                                                         //setting X position for the text image
  int textY=200;                                                                                         //setting Y position for the text image
  image(myMovie, 0, 0);                                                                                  //loads first video fragment

  if (press[9]==false) {
    image(texts[0], textX, textY);
  }                                                                                                     
  if (press[10]==false) {
    image(texts[1], textX, textY);
  } 
  if (press[11]==false) {
    image(texts[2], textX, textY);
  }                                                                                                      //if LDR is pressed, show respective image
}

void movieEvent(Movie m) {
  m.read();
}


void playVideo() {
  if (playing && myMovie.time() >= myMovie.duration() ) {
    playing = false;
    myMovie.stop();                                                                                       //video plays for the duration of the video and stops at last frame
  }

  if (!playing) {
    playing = true;                                                                                       //the movie that is playable is set to the movieobject that has to be played
    myMovie = movies.get(counter);

    myMovie.play();                                                                                       //movie is played
    myMovie.volume(0);                                                                                    //mute the audio of the video

    counter++;                                                                                            //the counter is incremented, because whenever a gummy capsense is touched, the video goes forward one step.

    if (counter >= 17) { 
      counter = 0;
    }                                                                                                     //now we check whether the counter is out of the arraylist index bounds and set it back to 0 (the index of the first video) if it is.
  }
}

void serialEvent(Serial c) {

  String inString = c.readString();                                                                       //read in the string
  String pairs [] = split(inString, ';');                                                                 //split the string up into pairs

  for (int u=0; u<pairs.length; u++) {
    String data[] = split(pairs[u], ':');                                                                 //split data
    if (data.length == 2) {                                                                               //continue only if there are 2 parts of data
      String label = trim(data[0]);                                                                       //remove white spaces
      String value = trim(data[1]);                                                                       //remove white spaces
      println(label);
      println(value);

      if (label.equals("T1")) {                                                                           //first capsense
        int val1 = int(value);
        if (val1>1000 && press[0]) {                

          melody[0].play();                                                                               //when gummy bear is pressed, play sound
          playVideo();

          press[0]=false;
        }
        if (val1<1000) {
          press[0]=true;
        }
      }

      if (label.equals("T2")) {                                                                          //second capsense
        int val2 = int(value);
        if (val2>1000 && press[1]) {                                                                     
          melody[1].play();                                                                              //when gummy bear is pressed, play sound
          playVideo();

          press[1]=false;
        }
        if (val2<1000) {
          press[1]=true;
        }
      }

      if (label.equals("T3")) {                                                                          //third capsense
        int val3 = int(value);                                                                           
        if (val3>1000 && press[2]) {
          melody[2].play();                                                                              //when gummy bear is pressed, play sound
          playVideo();

          press[2]=false;
        }
        if (val3<1000) {
          press[2]=true;
        }
      }

      if (label.equals("T4")) {                                                                           //fourth capsense
        int val4 = int(value);                                                                  
        if (val4>1000 && press[3]) {
          melody[3].play();                                                                               //when gummy bear is pressed, play sound
          playVideo();
          press[3]=false;
        }
        if (val4<1000) {
          press[3]=true;
        }
      }

      if (label.equals("T5")) {                                                                            //fifth capsense
        int val5 = int(value);
        if (val5>1000 && press[4]) {
          melody[4].play();                                                                                //when gummy bear is pressed, play sound
          playVideo();
          press[4]=false;
        }
        if (val5<1000) {
          press[4]=true;
        }
      }

      if (label.equals("T6")) {                                                                             //sixth capsense
        int val6 = int(value);
        if (val6>1000 && press[5]) {
          melody[5].play();                                                                                 //when gummy bear is pressed, play sound
          playVideo();
          press[5]=false;
        }
        if (val6<1000) {
          press[5]=true;
        }
      }

      if (label.equals("T7")) {                                                                             //seventh capsense
        int val7 = int(value);
        if (val7>1000 && press[6]) {  
          melody[6].play();                                                                                 //when gummy bear is pressed, play sound
          playVideo();
          press[6]=false;
        }
        if (val7<1000) {
          press[6]=true;
        }
      }

      if (label.equals("M1")) {                                                                              //eight capsense
        int valM1 = int (value);
        if (valM1>1000 && press[7]) {
          melody[7].play();                                                                                  //when marshmallow is pressed, play sound 
          press[7]=false;
        }
        if (valM1<1000) {
          press[7]=true;
        }
      }

      if (label.equals("M2")) {                                                                              //nineth capsense
        int valM2 = int (value);
        if (valM2>1000 && press[8]) {
          melody[8].play();                                                                                  //when marshmallow is pressed, play sound
          press[8]=false;
        }
        if (valM2<1000) {
          press[8]=true;
        }
      }

      if (label.equals("LDR1")) {                                                                            //first LDR
        int valLDR1 = int(value);
        if (valLDR1<660 && press[9]) {                                                                       //when LDR pressed, play sound
          melody[9].play(); 
          press[9]=false;
        }
        if (valLDR1>660) {
          press[9]=true;
        }
      }

      if (label.equals("LDR2")) {                                                                             //second LDR
        int valLDR2 = int(value);
        if (valLDR2<660 && press[10]) {                                                                      
          melody[10].play();                                                                                  //when LDR is pressed play sound
          press[10]=false;
        }
        if (valLDR2>660) {
          press[10]=true;
        }
      }

      if (label.equals("LDR3")) {                                                                             //third LDR
        int valLDR3 = int(value);
        if (valLDR3<660 && press[11]) {                  
          melody[11].play();                                                                                  //when LDR is pressed play sound
          press[11]=false;
        }
        if (valLDR3>660) {
          press[11]=true;
        }
      }
    }
  }
}