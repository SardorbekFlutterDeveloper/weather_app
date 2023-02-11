import 'package:ob_havo_app/home_cubit/home_cubit.dart';

import '../core/components/template.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? date;
  
  bool isSwitched = true;
   void toggleSwitch(bool valuee) {
    if (isSwitched == false) {
      isSwitched = true;
      // sets theme mode to light
      AdaptiveTheme.of(context).setLight();
     setState(() {
       
     });
    } else {
      isSwitched = false;
      AdaptiveTheme.of(context).setDark();
      setState(() {
        
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: myScaffold(context),
    );
  }

  Scaffold myScaffold(BuildContext context) {
    return Scaffold(body: BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          constraints: const BoxConstraints.expand(),
          margin: const EdgeInsets.only(top: 30),
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
                inactiveThumbColor: Colors.blue,
                inactiveTrackColor: Colors.blueAccent,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.55,
                margin: const EdgeInsets.fromLTRB(30, 60, 30, 10),
                padding: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 21, 118, 150), width: 2),
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
                      hourMinuteDigitTextStyle: TextStyle(
                          color: isSwitched ==  true
                              ? Colors.blue
                              : Colors.white,
                          fontSize: 95,
                          fontWeight: FontWeight.bold),

                      colon: Text(
                        ":",
                        style: TextStyle(
                            color:  isSwitched ==  true
                                ? Colors.blue
                                : Colors.white,
                            fontSize: 63,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      context
                          .watch<HomeCubit>()
                          .dateDate(context.watch<HomeCubit>().date),
                      style: TextStyle(
                         color: isSwitched ==  true
                              ? Colors.grey.shade600
                              : Colors.white,
                          fontSize: 43,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      context
                          .watch<HomeCubit>()
                          .dateFormatter(context.watch<HomeCubit>().date),
                      style: TextStyle(
                        color:  isSwitched ==  true
                            ? Colors.grey
                            : Colors.white,
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
        );
      },
    ));
  }
}
