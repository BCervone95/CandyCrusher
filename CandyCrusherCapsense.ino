#include <CapacitiveSensor.h>   //capacitive library for capsense parts

/*
   
  Hester van de Ven - s2000156
  Benedetta Cervone - s1443887

  We made a musical instrument that not only plays music, but also let's you play the game Candycrush. This way we hope to attract children's interest in learning how to play a musical instrument.
  The insturment consists of a piano-like part made out of capsenses, a drum-like part made out of cap senses and some special sound effects using LDRs.
  The theme of the game is very consistent in our creation since we not only implemented real life candy into it, but we also used sounds and sound effects from the game itself.
  The game can be played by pressing the gummy bears whatever order you'd like and by pressing the marshmellows to create a bass and snare sound. For the sound effects you have to cover the liquorice allsorts.
  To top it al off we added some gummy bears that light up when you play the piano part and the colours of the LEDs match the colors of the gummy bears that you play on.
  It's not only an interesting and interactive concept, it is also very enjoyable for all ages.
   
   Code source:
   CapitiveSense Library Demo Sketch
   Paul Badger 2008
   
*/

//Capsesnses
//Gummy bears
CapacitiveSensor   cs_2_3 = CapacitiveSensor(2, 3);       // 10M resistor between pins 2 and 3, pin 3 is sensor pin
CapacitiveSensor   cs_2_4 = CapacitiveSensor(2, 4);       
CapacitiveSensor   cs_2_5 = CapacitiveSensor(2, 5);       
CapacitiveSensor   cs_2_6 = CapacitiveSensor(2, 6);
CapacitiveSensor   cs_2_7 = CapacitiveSensor(2, 7);
CapacitiveSensor   cs_2_8 = CapacitiveSensor(2, 8);
CapacitiveSensor   cs_2_9 = CapacitiveSensor(2, 9);
//Marshmellows
CapacitiveSensor   cs_2_10 = CapacitiveSensor(2, 10);   
CapacitiveSensor   cs_2_11 = CapacitiveSensor(2, 11);

//Variables for ldr pins
int ldrPin1 = A8;
int ldrPin2 = A7;
int ldrPin3 = A6;

//Variables for LED pins
int ledPin1 = A5;
int ledPin2 = A4;
int ledPin3 = A3;
int ledPin4 = A2;
int ledPin5 = A1;
int ledPin6 = A0;
int ledPin7 = 13;

void setup()
{
  //Set al LED pins to output
  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  pinMode(ledPin3, OUTPUT);
  pinMode(ledPin4, OUTPUT);
  pinMode(ledPin5, OUTPUT);
  pinMode(ledPin6, OUTPUT);
  pinMode(ledPin7, OUTPUT);
  //Baud rate
  Serial.begin(9600); 
}

void loop()
{
 // Print header with LDR value in serial
  Serial.print(";LDR1:");
  Serial.print(analogRead(ldrPin1));
  Serial.print(";LDR2:");
  Serial.print(analogRead(ldrPin2));
  Serial.print(";LDR3:");
  Serial.print(analogRead(ldrPin3));

  // Pariables for capsenses
  //Gummy bears
  long total1 =  cs_2_3.capacitiveSensor(30);
  long total2 =  cs_2_4.capacitiveSensor(30);
  long total3 =  cs_2_5.capacitiveSensor(30);
  long total4 =  cs_2_6.capacitiveSensor(30);
  long total5 =  cs_2_7.capacitiveSensor(30);
  long total6 =  cs_2_8.capacitiveSensor(30);
  long total7 =  cs_2_9.capacitiveSensor(30);
  //Marshmellows
  long totalM1 = cs_2_10.capacitiveSensor(30);
  long totalM2 = cs_2_11.capacitiveSensor(30);


  //Pint header with capsense values in serial
  //Gummy bears
  Serial.print(";T1:");
  Serial.print(total1);   
  Serial.print(";T2:");
  Serial.print(total2);           
  Serial.print(";T3:");
  Serial.print(total3);           
  Serial.print(";T4:");
  Serial.print(total4);
  Serial.print(";T5:");
  Serial.print(total5);
  Serial.print(";T6:");
  Serial.print(total6);
  Serial.print(";T7:");
  Serial.print(total7);
  //Marshmellows
  Serial.print(";M1:");
  Serial.print(totalM1);
  Serial.print(";M2:");
  Serial.print(totalM2);
  Serial.print('\n');

//Turn on LED when gummy bear capsense gets pressed, otherwise turn LED off
  if (total1 > 200) {
    analogWrite(ledPin1, 1023);
    delay(100);
  }
  else {
    analogWrite(ledPin1, 0);
  }
  if (total2 > 200) {
    analogWrite(ledPin2, 1023);
    delay(100);
  }
  else {
    analogWrite(ledPin2, 0);
  }
  if (total3 > 200) {
    analogWrite(ledPin3, 1023);
    delay(100);
  }
  else {
    analogWrite(ledPin3, 0);
  }

  if (total4 > 200) {
    analogWrite(ledPin4, 1023);
    delay(100);
  }
  else {
    analogWrite(ledPin4, 0);
  }
  if (total5 > 200) {
    analogWrite(ledPin5, 1023);
    delay(100);
  }
  else {
    analogWrite(ledPin5, 0);
  }
  if (total6 > 200) {
    analogWrite(ledPin6, 1023);
    delay(100);
  }
  else {
    analogWrite(ledPin6, 0);
  }

  if (total7 > 300) {
    digitalWrite(ledPin7, HIGH);
    delay(100);
  }
  else {
    digitalWrite(ledPin7, LOW);
  }

}
