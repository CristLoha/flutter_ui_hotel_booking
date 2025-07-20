import 'package:flutter/material.dart';
import 'package:flutter_ui_hotel_booking/common/app_colors.dart';
import 'package:flutter_ui_hotel_booking/common/app_constants.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class DasboardPage extends StatefulWidget {
  const DasboardPage({super.key});

  @override
  State<DasboardPage> createState() => _DasboardPageState();
}

class _DasboardPageState extends State<DasboardPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppConstants.menuBottomNav[_currentIndex]['ui'],
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(24, 24, 24, 36),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -5),
              blurRadius: 6,
              color: Color(0xff939393).withValues(alpha: 0.14),
            ),
          ],
        ),
        child: GNav(
          duration: Duration(microseconds: 200),
          onTabChange: (value) {
            _currentIndex = value;
            setState(() {});
          },
          activeColor: AppColors.primaryNormal,
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: AppColors.primaryNormal,
          ),
          tabs: List.generate(AppConstants.menuBottomNav.length, (index) {
            final isActive = _currentIndex == index;
            final item = AppConstants.menuBottomNav[index];

            return GButton(
              icon: Icons.nat,
              text: item['label'],
              backgroundColor: isActive
                  ? AppColors.accentBlue
                  : Colors.transparent,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              gap: 4,
              leading: ImageIcon(
                AssetImage(item[isActive ? 'icon_on' : 'icon_off']),
                size: 24,
                color: isActive
                    ? AppColors.primaryNormal
                    : AppColors.blackNormal,
              ),
            );
          }),
        ),
      ),
    );
  }
}
