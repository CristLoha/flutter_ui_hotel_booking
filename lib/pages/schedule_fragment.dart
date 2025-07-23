import 'package:flutter/material.dart';
import 'package:flutter_ui_hotel_booking/common/app_colors.dart';
import 'package:flutter_ui_hotel_booking/models/hotel.dart';
import 'package:flutter_ui_hotel_booking/models/schedule.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleFragment extends StatefulWidget {
  const ScheduleFragment({super.key});

  @override
  State<ScheduleFragment> createState() => _ScheduleFragmentState();
}

class _ScheduleFragmentState extends State<ScheduleFragment> {
  final DateTime _now = DateTime.now();
  late DateTime _focusDay = DateTime.now();

  void _changeCalendarPage(bool isNext) {
    final month = isNext ? _focusDay.month + 1 : _focusDay.month - 1;
    _focusDay = DateTime(_focusDay.year, month, 1);
    setState(() {});
  }

  @override
  void initState() {
    _focusDay = DateTime(_now.year, _now.month, 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Gap(24),
        _buildAppBar(),
        Gap(24),
        _buildCalendar(),
        Gap(16),
        _buildMySchedule(),
      ],
    );
  }

  Widget _buildAppBar() {
    return SizedBox(
      height: 48,
      child: Center(
        child: Text(
          'Detail',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: AppColors.blackNormal,
          ),
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
      decoration: BoxDecoration(
        color: AppColors.greyLight,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  DateFormat('MMMM yyyy').format(_focusDay),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.blackNormal,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => _changeCalendarPage(false),
                icon: ImageIcon(
                  AssetImage('assets/icons/arrow-left.png'),
                  size: 24,
                  color: AppColors.blackNormal,
                ),
              ),
              IconButton(
                onPressed: () => _changeCalendarPage(true),
                icon: ImageIcon(
                  AssetImage('assets/icons/arrow-right.png'),
                  size: 24,
                  color: AppColors.blackNormal,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Divider(
              color: Color(0xffe5e5e5).withValues(alpha: 0.2),
              height: 1,
              //radius
              radius: BorderRadius.circular(100),
            ),
          ),
          Gap(16),
          TableCalendar(
            focusedDay: _focusDay,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            headerVisible: false,
            onPageChanged: (focusedDay) {
              _focusDay = focusedDay;
              setState(() {});
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryNormal,
              ),
            ),
            calendarBuilders: CalendarBuilders(
              dowBuilder: (context, day) {
                return Center(
                  child: Text(
                    DateFormat('EEEEE').format(day),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: AppColors.blackNormal,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMySchedule() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Schedule',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColors.blackNormal,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColors.primaryNormal,
                ),
              ),
            ],
          ),
          Gap(16),
          ListView.builder(
            itemCount: mySchedule.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(0),
            itemBuilder: (context, index) {
              final item = mySchedule[index];

              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/detail', arguments: item);
                },
                child: _buildMyScheduleItem(item),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMyScheduleItem(Schedule item) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      height: 108,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 45,
            color: Color(0xff1B1B4D).withValues(alpha: 0.04),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              item.image,
              width: 84,
              height: 84,
              fit: BoxFit.cover,
            ),
          ),
          Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.blackNormal,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Gap(4),
                Row(
                  spacing: 5,
                  children: [
                    ImageIcon(
                      AssetImage('assets/icons/calendar.png'),
                      size: 16,
                      color: AppColors.blackLighter,
                    ),

                    Text(
                      DateFormat('dd MMMM yyyy').format(item.date),
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppColors.blackLighter,
                      ),
                    ),
                  ],
                ),
                Gap(12),
                Row(
                  children: [
                    Text(
                      NumberFormat.currency(
                        locale: 'en_US',
                        symbol: '\$',
                      ).format(item.price),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: AppColors.primaryNormal,
                      ),
                    ),
                    Text(
                      ' /night',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppColors.blackLighter,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ImageIcon(
            AssetImage('assets/icons/arrow-right.png'),
            size: 24,
            color: Color(0xff000000),
          ),
        ],
      ),
    );
  }
}
