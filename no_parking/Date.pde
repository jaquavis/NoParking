class Date {
  final String [] days = {"Monday", "Tuesday", "Wednesday", "Thusday", "Friday", "Saturday", "Sunday"};
  int today;
  int hour;
  int minute;
  boolean before_noon;

  Date (int d, int h, int m, boolean beforeNoon) {
    today = d%7;
    hour = h%13;
    minute = m%60;
    before_noon = beforeNoon;
  }
  
  Date (Date d) {
    today = d.today;
    hour = d.hour;
    minute = d.minute;
    before_noon = d.before_noon;
  }
  
  Date () { // Constructs to Monday 12:00 AM
    today=0;
    hour=0;
    minute=0;
    before_noon=true;
  }
  
  void addMinute() {  // function to add minute to date
    minute+=1;
    if (minute>=60) {
      minute=0;
      addHour();
    }
  }
  
  void addHour() {  // function to add hour to date
    hour+=1;
    if (hour>12) {
      hour=1;
    }
    if ((hour>11)&&(before_noon)) {
      before_noon = false;
    } else if ((hour>11)&&(before_noon == false)) {
      before_noon=true;
      today+=1;
    }
    if (today>6) {
      today = 0;
    }
  }
  
  String toString() { // Convets numerical date value into string value
    String date = days[today];
    if ((hour<10)&&(hour!=0)) {
      date+= " 0" + hour;
    } else if (hour==0) {
      date+= " " + 12;
    } else {
      date+= " " + hour;
    }
    if (minute<10) {
      date += ":0" + minute;
    } else {
      date += ":" + minute;
    }
    if (before_noon) {
      date += "AM";
    } else {
      date+= "PM";
    }
    return date;
  }
  
  boolean equal (Date d) { // Determins wether given date is equal to current date
    if ((today==d.today)&&(hour==d.hour)&&(minute==d.minute)&&(before_noon==d.before_noon)) {
      return true;
    }
    return false;
  }

  float toHour() {  // function to convert date value to hours
    float total;
    float days=today*24;
    float hours=hour;
    if ((before_noon==false)&&(hour!=12)) {
      hours+=12;
    }
    if ((before_noon)&&(hour==12)) {
      hours-=12;
    }
    float minutes=(float)minute/60;
    total=days+hours+minutes;
    return total;
  } 

  boolean inWeek() { // Determines wether date is between Monday 12:00AM and Saturday 11:59PM, or anytime on Sunday
    if (toHour()>=priceCalculator.STARTWEEK.toHour()&&toHour()<priceCalculator.ENDWEEK.toHour()) {
      return true;
    }
    return false;
  }
}

Date randomDate() { // Assigns random date between Monday 12:00AM and Sunday 11:59PM
  Date d = new Date((int)random(0, 7), (int)random(1, 13), (int)random(0, 61), ((int)random(0, 2)==0));
  return d;
}