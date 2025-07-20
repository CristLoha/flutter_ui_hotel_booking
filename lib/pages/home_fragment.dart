import 'package:flutter/material.dart';
import 'package:flutter_ui_hotel_booking/common/app_colors.dart';
import 'package:flutter_ui_hotel_booking/common/app_constants.dart';
import 'package:flutter_ui_hotel_booking/models/hotel.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  int _indexCategory = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildHeader(),
        Gap(32),
        _buildCategories(),
        Gap(24),
        _buildNearLocation(),
        Gap(24),
        _buildPopularHotels(),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current location',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColors.blackLighter,
                  ),
                ),
                Gap(8),
                Row(
                  children: [
                    ImageIcon(
                      AssetImage('assets/icons/location.png'),
                      size: 24,
                      color: AppColors.primaryNormal,
                    ),
                    Gap(8),
                    Text(
                      'Wallace, Australia',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.blackNormal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Color(0xffECECEC)),
                ),
              ),
              fixedSize: WidgetStatePropertyAll(Size(40, 40)),
            ),
            icon: Badge(
              alignment: Alignment(0.9, -0.9),
              smallSize: 10,
              backgroundColor: AppColors.accentRed,
              child: ImageIcon(
                AssetImage('assets/icons/notification-bing.png'),
              ),
            ),
            iconSize: 24,
            color: Color(0xff000000),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 37,
      child: ListView.builder(
        itemCount: AppConstants.categories.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = AppConstants.categories[index];
          final isActive = _indexCategory == index;
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 24 : 8,
              right: index == AppConstants.categories.length - 1 ? 24 : 8,
            ),
            child: GestureDetector(
              onTap: () {
                _indexCategory = index;
                setState(() {});
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: isActive
                      ? AppColors.primaryNormal
                      : AppColors.greyLight,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      ImageIcon(
                        AssetImage(item.$1),
                        size: 24,
                        color: isActive ? Colors.white : AppColors.blackLighter,
                      ),
                      Text(
                        item.$2,
                        style: TextStyle(
                          fontWeight: isActive
                              ? FontWeight.w600
                              : FontWeight.w400,
                          fontSize: 14,
                          color: isActive
                              ? Colors.white
                              : AppColors.blackLighter,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNearLocation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Near Location',
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
        ),
        const Gap(16),
        SizedBox(
          height: 286,
          child: ListView.builder(
            itemCount: nearLocationHotel.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final item = nearLocationHotel[index];
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 24 : 8,
                  right: index == nearLocationHotel.length - 1 ? 24 : 8,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/detail', arguments: item);
                  },
                  child: Container(
                    width: 257,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius: 45,
                          color: Color(0xff1B1B4D).withValues(alpha: 0.04),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                                child: Image.asset(
                                  item.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 12,
                                right: 16,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      item.isFavorite = !item.isFavorite;
                                    });
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                      Colors.white,
                                    ),
                                  ),
                                  icon: item.isFavorite
                                      ? Image.asset(
                                          'assets/icons/heart-bold.png',
                                          width: 24,
                                        )
                                      : ImageIcon(
                                          AssetImage(
                                            'assets/icons/heart-bold.png',
                                          ),
                                          color: AppColors.blackLighter,
                                          size: 20,
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      item.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: AppColors.blackNormal,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Row(
                                    spacing: 8,
                                    children: [
                                      ImageIcon(
                                        AssetImage(
                                          'assets/icons/star-bold.png',
                                        ),
                                        size: 20,
                                        color: AppColors.accentYellow,
                                      ),
                                      Text(
                                        '${item.rate}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: AppColors.blackNormal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Gap(4),
                              Text(
                                item.location,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: AppColors.blackLighter,
                                ),
                              ),
                              Gap(16),
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
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPopularHotels() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popilar Hotels',
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
            itemCount: popularHotel.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(0),
            itemBuilder: (context, index) {
              final item = popularHotel[index];
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
                              Expanded(
                                child: Text(
                                  item.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: AppColors.blackNormal,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Row(
                                spacing: 8,
                                children: [
                                  ImageIcon(
                                    AssetImage('assets/icons/star-bold.png'),
                                    size: 20,
                                    color: AppColors.accentYellow,
                                  ),
                                  Text(
                                    '${item.rate}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: AppColors.blackNormal,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Gap(4),
                          Text(
                            item.location,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.blackLighter,
                            ),
                          ),
                          Gap(16),
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
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
