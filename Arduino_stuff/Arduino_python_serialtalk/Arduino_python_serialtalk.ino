#include <LiquidCrystal.h>

LiquidCrystal lcd(7, 8, 9, 10, 11, 12);



void setup() {
  Serial.begin(9600);
  // put your setup code here, to run once:
  lcd.begin(16, 2);// num cols and rows (from now on 0 is the 1st)
  lcd.setCursor(0,0); //(row,col) this is starting from 0,0 in the upper left!!!!
  lcd.write("READY TO BE");
  lcd.setCursor(0,1);
  lcd.write("PENETRATED");
//  lcd.noCursor();
//  delay(2000);

}

void loop() {
  if (Serial.available()) {
    // wait a bit for the entire message to arrive
    delay(100);
    // clear the screen
    lcd.clear();
    // read all the available characters
    while (Serial.available() > 0) {
      // display each character to the LCD
      lcd.write(Serial.read());
    }
    Serial.write("hi python \n");
  }
  // put your main code here, to run repeatedly:
}
