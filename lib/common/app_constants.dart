import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_hotel_booking/pages/home_fragment.dart';
import 'package:flutter_ui_hotel_booking/pages/schedule_fragment.dart';

class AppConstants {
  static const categories = [
    ('assets/icons/house-2.png', 'Hotel'),
    ('assets/icons/building-3.png', 'Homestay'),
    ('assets/icons/buildings.png', 'Apart'),
    ('assets/icons/renthouse.png', 'RentHouse'),
  ];

  static const menuBottomNav = <Map<String, dynamic>>[
    {
      'label': 'Home',
      'icon_on': 'assets/icons/home-2-bold.png',
      'icon_off': 'assets/icons/home-2.png',
      'ui': HomeFragment(),
    },
    {
      'label': 'Schedule',
      'icon_on': 'assets/icons/calendar-bold.png',
      'icon_off': 'assets/icons/calendar.png',
      'ui': ScheduleFragment(),
    },
    {
      'label': 'Bookmark',
      'icon_on': 'assets/icons/bookmark.png',
      'icon_off': 'assets/icons/bookmark.png',
      'ui': Center(child: Text('Bookmark')),
    },
    {
      'label': 'Profile',
      'icon_on': 'assets/icons/profile.png',
      'icon_off': 'assets/icons/profile.png',
      'ui': Center(child: Text('Profile')),
    },
  ];
}
