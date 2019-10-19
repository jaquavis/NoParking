class Price_Calculator {
  float totalprice; // keeps track of total price as time progresses
  final float WEEKRATE = 3.00; // $/hr
  final float SUNRATE = 1.50; // $/hr
  final Date STARTWEEK = new Date (0, 12, 0, true); // final start of payment week
  final Date ENDWEEK = new Date (6, 12, 0, true); // final end of payment week

  float PriceCalc(int a, int b, int c, int d) { // function to return price for specific stall
    float tempprice=0;
    float temphours=0;
    Date start = lot.sections[a][b].stalls[c][d].timeTaken;
    Date end = lot.sections[a][b].stalls[c][d].timeLeft;
    temphours = end.toHour()-start.toHour();
    if (start.inWeek()&&end.inWeek()) {  // start and end both in week
      tempprice = temphours*WEEKRATE;
    }
    if (start.inWeek()==false&&end.inWeek()==false) {  // start and end both in weekend
      tempprice = temphours*SUNRATE;
    }
    if (start.inWeek()&&end.inWeek()==false) {  // start in week, end in weekend
      tempprice += (ENDWEEK.toHour()-start.toHour())*WEEKRATE;
      tempprice += (end.toHour()-ENDWEEK.toHour())*SUNRATE;
    }
    if (start.inWeek()==false&&end.inWeek()) {   // start in weekend, end in week
      tempprice += (STARTWEEK.toHour()-start.toHour())*SUNRATE;
      tempprice += (end.toHour()-STARTWEEK.toHour())*WEEKRATE;
    }

    totalprice+=tempprice;
    return tempprice;
  }
}