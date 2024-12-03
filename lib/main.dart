import 'package:dynamic_color/pages/color_first/color_first_binding.dart';
import 'package:dynamic_color/pages/color_first/color_first_view.dart';
import 'package:dynamic_color/pages/color_first/sube_ap.dart';
import 'package:dynamic_color/pages/color_second/color_second_binding.dart';
import 'package:dynamic_color/pages/color_second/color_second_view.dart';
import 'package:dynamic_color/pages/color_tab/color_tab_binding.dart';
import 'package:dynamic_color/pages/color_tab/color_tab_view.dart';
import 'package:dynamic_color/pages/color_tab/tab_besc/tab_besc_binding.dart';
import 'package:dynamic_color/pages/color_tab/tab_besc/tab_besc_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color primaryColor = const Color(0xffff9d00);
Color bgColor = const Color(0xff343434);
List<Color> accentColors = [
  const Color(0xffffffff),
  const Color(0xffffe396),
  const Color(0xffdbff96),
  const Color(0xff96f7ff),
  const Color(0xff96b2ff),
  const Color(0xffff96df)
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Pages,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: Colors.grey[600],
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.black,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Pages = [
  GetPage(name: '/', page: () => const TabBescView(), binding: TabBescBinding()),
  GetPage(name: '/colorTab', page: () => ColorTabPage(), binding: ColorTabBinding()),
  GetPage(name: '/colorFirst', page: () => const ColorFirstPage(), binding: ColorFirstBinding()),
  GetPage(name: '/colorLong', page: () => const SubeAp()),
  GetPage(name: '/colorSecond', page: () => ColorSecondPage(), binding: ColorSecondBinding()),
];
