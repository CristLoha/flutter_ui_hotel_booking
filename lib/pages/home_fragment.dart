import 'package:flutter/material.dart';
import 'package:flutter_ui_hotel_booking/common/app_colors.dart';
import 'package:flutter_ui_hotel_booking/common/app_constants.dart';
import 'package:flutter_ui_hotel_booking/models/hotel.dart';
import 'package:flutter_ui_hotel_booking/widgets/custom_icon_button.dart';
import 'package:flutter_ui_hotel_booking/widgets/favorite_icon_button.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment>
    with TickerProviderStateMixin {
  int _indexCategory = 0;
  int? _tappedIndex;

  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Gap(24),
          _buildHeader(),
          Gap(32),
          _buildCategories(),
          Gap(24),
          _buildNearLocation(),
          Gap(24),
          _buildPopularHotels(),
        ],
      ),
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
          CustomIconButton(
            assets: 'assets/icons/notification-bing.png',
            showBadge: true,
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
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeOut,
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
                      AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 200),
                        style: TextStyle(
                          fontWeight: isActive
                              ? FontWeight.w600
                              : FontWeight.w400,
                          fontSize: 14,
                          color: isActive
                              ? Colors.white
                              : AppColors.blackLighter,
                        ),
                        child: Text(item.$2),
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
                  child: _buildNearLocationItem(item),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNearLocationItem(Hotel item) {
    return Container(
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
                  child: Image.asset(item.image, fit: BoxFit.cover),
                ),
                FavoriteIconButton(
                  item: item,
                  onPressed: () {
                    setState(() {
                      item.isFavorite = !item.isFavorite;
                    });
                  },
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
                'Popular Hotels',
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
              final isTapped = _tappedIndex == index;

              return GestureDetector(
                onTapDown: (_) => setState(() => _tappedIndex = index),
                onTapUp: (_) => setState(() => _tappedIndex = null),
                onTapCancel: () => setState(() => _tappedIndex = null),
                onTap: () {
                  Navigator.pushNamed(context, '/detail', arguments: item);
                },
                child: AnimatedScale(
                  scale: isTapped ? 0.97 : 1.0,
                  duration: Duration(milliseconds: 100),
                  child: _buildAnimatedHotelItem(item, index),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedHotelItem(Hotel item, int index) {
    final animation =
        Tween<Offset>(
          begin: Offset(0, 0.1 * (index + 1)),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(0.1 * index, 1.0, curve: Curves.easeOut),
          ),
        );

    return SlideTransition(
      position: animation,
      child: FadeTransition(
        opacity: _controller,
        child: _buildPopularHotelItem(item),
      ),
    );
  }

  Widget _buildPopularHotelItem(Hotel item) {
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
  }
}
