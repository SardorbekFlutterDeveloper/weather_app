import 'dart:ui';

import '../core/components/template.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AdaptiveThemeMode? themeMode;
  Future<void> _getMode() async {
    themeMode = await AdaptiveTheme.getThemeMode();
    setState(() {});
  }

  DateTime? date;
  final _widthThreshold = 600.0;
  bool isSwitched = true;
  void toggleSwitch(bool valuee) {
    if (isSwitched == false) {
      isSwitched = true;
      // sets theme mode to light
      AdaptiveTheme.of(context).setLight();
      setState(() {});
    } else {
      isSwitched = false;
      AdaptiveTheme.of(context).setDark();
      setState(() {});
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
    final size = window.physicalSize / window.devicePixelRatio;
    final width = context.width;
    final isTablet = width > _widthThreshold;
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Container(
              height: context.height,
              width: context.width,
              constraints: const BoxConstraints.expand(),
              margin: const EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: isSwitched == false
                      ? const AssetImage(
                          "assets/background_light.png",
                        )
                      : const AssetImage(
                          "assets/background.png",
                        ),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  switchAdaptive(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.55,
                    margin: const EdgeInsets.fromLTRB(30, 60, 30, 10),
                    padding: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 21, 118, 150),
                          width: 2),
                      borderRadius: BorderRadius.circular(15),
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
                        digitalClock(),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          context
                              .watch<HomeCubit>()
                              .dateDate(context.watch<HomeCubit>().date),
                          style: TextStyle(
                              color: isSwitched == true
                                  ? ColorConst.instance.kDarkGrey
                                  : ColorConst.instance.kWhite,
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
                            color: isSwitched == true
                                ? ColorConst.instance.kLightGrey
                                : ColorConst.instance.kWhite,
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
                      padding: const EdgeInsets.only(
                          top: 80, bottom: 10, left: 10, right: 10),
                      child: Image.asset(
                        "assets/gerb.png",
                        height: 140,
                        width: 170,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Positioned(
                    left:
                        isTablet ? context.width * 0.15 : context.width * 0.12,
                    top: isTablet
                        ? context.height * 0.65
                        : context.height * 0.675,
                    child: SizedBox(
                      height: isTablet
                          ? context.height * 0.15
                          : context.height * 0.3,
                      width:
                          isTablet ? context.width * 0.15 : context.width * 0.3,
                      child: Image.asset("assets/partly_cloudy.png"),
                    ),
                  ),
                  Positioned(
                    left: isTablet ? context.width * 0.4 : context.width * 0.5,
                    top:
                        isTablet ? context.height * 0.68 : context.height * 0.7,
                    child: Text(
                      "+27°",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Positioned(
                    left: isTablet ? context.width * 0.6 : context.width * 0.5,
                    top:
                        isTablet ? context.height * 0.7 : context.height * 0.83,
                    child: Text(
                      "Тошкент",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }

  DigitalClock digitalClock() {
    return DigitalClock(
      // is24HourTimeFormat: false,
      showSecondsDigit: false,
      hourMinuteDigitTextStyle: TextStyle(
          color: isSwitched == true
              ? ColorConst.instance.kBlue
              : ColorConst.instance.kWhite,
          fontSize: 95,
          fontWeight: FontWeight.bold),

      colon: Text(
        ":",
        style: TextStyle(
            color: isSwitched == true
                ? ColorConst.instance.kBlue
                : ColorConst.instance.kWhite,
            fontSize: 63,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Switch switchAdaptive() {
    return Switch(
      value: isSwitched,
      thumbIcon: MaterialStateProperty.all(Icon(
        isSwitched == false
            ? Icons.dark_mode_outlined
            : Icons.light_mode_outlined,
            color: Theme.of(context).cardColor,
      )),
      onChanged: toggleSwitch,
      activeColor: ColorConst.instance.kBlue,
      activeTrackColor: ColorConst.instance.kBlue,
      inactiveThumbColor: ColorConst.instance.kBlue,
      inactiveTrackColor: ColorConst.instance.kBlue,
    );
  }
}
