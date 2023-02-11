import 'dart:convert';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import 'package:slide_digital_clock/slide_digital_clock.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime date = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      date;
    });
  }

  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        // sets theme mode to light
        AdaptiveTheme.of(context).setLight();
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        AdaptiveTheme.of(context).setDark();
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      constraints: const BoxConstraints.expand(),
      margin: EdgeInsets.only(top: 30),
      decoration: const BoxDecoration(
        
        image: DecorationImage(
          image: AssetImage(
            "assets/background.png",
          ),
        ),
      ),
      child: Stack(
       
        children: <Widget>[
           
          Switch(
            value: isSwitched,
            onChanged: toggleSwitch,
            activeColor: Colors.blue,
            activeTrackColor: Colors.blueAccent,
            inactiveThumbColor:  Colors.blue,
            inactiveTrackColor: Colors.blueAccent,
          ),
         
         
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.55,
            margin: const EdgeInsets.fromLTRB(30, 60, 30, 10),
            padding: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border.all(

                  color: Color.fromARGB(255, 21, 118, 150), width: 2),
              borderRadius: BorderRadius.circular(15),
              shape: BoxShape.rectangle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 30,
                ),
                DigitalClock(
                  // is24HourTimeFormat: false,
                  showSecondsDigit: false,
                  hourMinuteDigitTextStyle:  TextStyle(
                      color: isSwitched == true ? Colors.blue : Colors.white,
                      fontSize: 95,
                      fontWeight: FontWeight.bold),

                  colon:  Text(
                    ":",
                    style: TextStyle(
                       color: isSwitched == true ? Colors.blue : Colors.white,
                        fontSize: 63,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                      dateDate(date),
                      style:  TextStyle(
                        color: isSwitched == true ? Colors.grey.shade600 : Colors.white,
                          fontSize: 43,
                          fontWeight: FontWeight.bold),
                    ),
                   
                 const SizedBox(
                      height: 10,
                    ),
                    Text(
                      dateFormatter(date),
                      style:  TextStyle(
                          color: isSwitched == true ? Colors.grey : Colors.white,
                          fontSize: 53,
                         ),
                    ),

              ],
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.25,
            top: -80,
            child: Container(
              // margin:  const EdgeInsets.only( top: 20 ,bottom: 10, left: 10, right: 10),
              padding: const EdgeInsets.only(
                  top: 80, bottom: 10, left: 10, right: 10),
            

              child: Image.asset(
                "assets/gerb.png",
                height: 140,
                width: 170,
              ),
            ),
          ),
        ],
      ),
    ));
  }

  String dateDate(DateTime date) {
    dynamic monthData =
        '{ "1" : "январ", "2" : "ферврал", "3" : "март", "4" : "апрел", "5" : "май", "6" : "июн", "7" : "июл", "8" : "август", "9" : "сентябр", "10" : "октябр", "11" : "ноябр", "12" : "декабр" }';
    return date.day.toString() + " " + json.decode(monthData)['${date.month}'];
  }

  String dateFormatter(DateTime date) {
    dynamic dayData =
        '{ "1" : "Душанба", "2" : "Сешанба", "3" : "Чоршанба", "4" : "Пайшанба", "5" : "Жума", "6" : "Шанба", "7" : "Якшанба" }';

    dynamic monthData =
        '{ "1" : "январ", "2" : "ферврал", "3" : "март", "4" : "апрел", "5" : "май", "6" : "июн", "7" : "июл", "8" : "август", "9" : "сентябр", "10" : "октябр", "11" : "ноябр", "12" : "декабр" }';

    return json.decode(dayData)['${date.weekday}'];
  }
}
