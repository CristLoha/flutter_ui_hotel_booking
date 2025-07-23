import 'package:flutter/material.dart';
import 'package:flutter_ui_hotel_booking/common/app_colors.dart';
import 'package:flutter_ui_hotel_booking/models/hotel.dart';
import 'package:flutter_ui_hotel_booking/widgets/custom_icon_button.dart';
import 'package:flutter_ui_hotel_booking/widgets/favorite_icon_button.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatefulWidget {
  final Hotel hotel;
  const DetailPage({super.key, required this.hotel});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(68), 
        child: SafeArea(child: _buildAppBar()),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: [
            Gap(24),
            _buildImage(widget.hotel),
            Gap(16),
            _buildFacilities(),
            Gap(24),
            _buildMainInfo(),
            Gap(10),
            _buildDescription(),
            Gap(22),
            _buildPreview(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBooking(),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            assets: 'assets/icons/arrow-left.png',
            onPressed: () => Navigator.pop(context),
          ),
          Text(
            'Detail',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.blackNormal,
            ),
          ),
          CustomIconButton(assets: 'assets/icons/more.png'),
        ],
      ),
    );
  }

  Widget _buildImage(Hotel item) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            widget.hotel.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 216,
          ),
        ),
        FavoriteIconButton(
          item: item,
          onPressed: () {
            setState(() {
              item.isFavorite = !item.isFavorite;
            });
          },
          postionedRight: 12,
        ),
      ],
    );
  }

  Widget _buildFacilities() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildHotelFeatureItem(
              iconPath: 'assets/icons/wifi-square.png',
              label: 'Free Wi-Fi',
            ),
            buildHotelFeatureItem(
              iconPath: 'assets/icons/coffee.png',
              label: 'Free Breakfast',
            ),
            buildHotelFeatureItem(
              iconPath: 'assets/icons/star-bold.png',
              label: '${widget.hotel.rate} ',
              iconSize: 20,
              colorIcon: AppColors.accentYellow,
            ),
          ],
        ),
      ],
    );
  }

  Widget buildHotelFeatureItem({
    required String iconPath,
    required String label,
    double iconSize = 24,
    Color colorIcon = AppColors.blackNormal,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.accentBlue,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageIcon(AssetImage(iconPath), color: colorIcon, size: iconSize),
          Gap(6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.blackNormal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainInfo() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.hotel.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColors.blackNormal,
              ),
            ),
            Row(
              children: [
                Text(
                  NumberFormat.currency(
                    locale: 'en_US',
                    symbol: '\$',
                  ).format(widget.hotel.price),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.primaryNormal,
                  ),
                ),
                Text(
                  ' /night',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.blackLighter,
                  ),
                ),
              ],
            ),
          ],
        ),
        Gap(8),
        Row(
          children: [
            ImageIcon(
              AssetImage('assets/icons/location.png'),
              color: AppColors.primaryNormal,
              size: 18,
            ),
            Gap(8),
            Text(
              widget.hotel.location,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColors.blackNormal,
          ),
        ),
        Gap(8),
        ReadMoreText(
          widget.hotel.description,
          trimMode: TrimMode.Length,
          trimLength: 139,
          delimiter: '',
          trimCollapsedText: ' Read More...',
          trimExpandedText: ' Read Less...',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12,
            color: AppColors.blackLighter,
          ),
          moreStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: AppColors.primaryNormal,
          ),
          lessStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: AppColors.primaryNormal,
          ),
        ),
      ],
    );
  }

  Widget _buildPreview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Preview',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColors.blackNormal,
          ),
        ),
        Gap(8),
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(0),
          childAspectRatio: 1.3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: widget.hotel.preview.map((e) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(e, fit: BoxFit.cover),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildBooking() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 36),
      child: SizedBox(
        height: 56,
        child: FilledButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          child: Text(
            'Booking Now',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
