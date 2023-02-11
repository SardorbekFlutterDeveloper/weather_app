import 'package:ob_havo_app/core/components/template.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (light, dark) {
        return adaptiveTheme();
      },
    );
  }

  AdaptiveTheme adaptiveTheme() {
    return AdaptiveTheme(
      light: LightTheme.lightTheme,
      dark: DarkTheme.darkTheme,
      initial: AdaptiveThemeMode.light,
      builder: (lightTheme, darkTheme) => MaterialApp(
        title: 'Weather App',
        theme: lightTheme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: "/home",
        onGenerateRoute: Routes.instance.onGenerateRoute,
      ),
    );
  }
}
