import 'package:flutter/material.dart';
import 'package:flutter_ui_hotel_booking/common/app_colors.dart';
import 'package:flutter_ui_hotel_booking/models/hotel.dart';
import 'package:flutter_ui_hotel_booking/pages/dasboard_page.dart';
import 'package:flutter_ui_hotel_booking/pages/detail_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.light(primary: AppColors.primaryNormal),
        primaryColor: AppColors.primaryNormal, 
        textTheme: GoogleFonts.interTextTheme(),
      ),
      routes: {
        '/': (context) => DasboardPage(),
        '/detail': (context) {
          final hotel = ModalRoute.settingsOf(context)?.arguments as Hotel?;
          if (hotel == null) return Scaffold();
          return DetailPage(hotel: hotel);
        },
      },
    );
  }
}
