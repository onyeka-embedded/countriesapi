import 'package:countriesapp/provider/countries_provider.dart';
import 'package:countriesapp/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'const/theme_data.dart';
import 'provider/theme_provider.dart';
import 'screens/detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

DarkThemeProvider themeChangeProvider = DarkThemeProvider();
    void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {  
    return MultiProvider(
             providers: [
                   ChangeNotifierProvider(create: (_) {
                   return themeChangeProvider;
                           }),
                         ChangeNotifierProvider(create: (_){
                           return CountriesProvider();
                         }),
                      ],
      child: ScreenUtilInit(
        designSize: const Size(428.0, 926.0,),  
         builder: (context, index) => Consumer<DarkThemeProvider>(
           builder: (context, themeProvider, child) {
             return MaterialApp(
                builder: (context, widget){
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: widget!,
                  );
                },
                    debugShowCheckedModeBanner: false,
                    title: 'Flutter Demo',
                    theme: Themes.light,
                     themeMode: themeProvider.themeMode,
                     darkTheme: Themes.dark,
                home: const MainScreen(),
              );
           }
         ),
         ),
      );  
      }
  }

