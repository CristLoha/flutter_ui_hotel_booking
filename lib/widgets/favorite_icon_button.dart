import 'package:flutter/material.dart';
import 'package:flutter_ui_hotel_booking/common/app_colors.dart';
import 'package:flutter_ui_hotel_booking/models/hotel.dart';

class FavoriteIconButton extends StatefulWidget {
  final Hotel item;
  final Function()? onPressed;
  final double postionedRight;
  const FavoriteIconButton({
    super.key,
    required this.item,
    required this.onPressed,
    this.postionedRight = 16,
  });

  @override
  State<FavoriteIconButton> createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 12,
      right: widget.postionedRight,
      child: IconButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.white),
        ),
        icon: widget.item.isFavorite
            ? Image.asset('assets/icons/heart-bold.png', width: 24)
            : ImageIcon(
                AssetImage('assets/icons/heart-bold.png'),
                color: AppColors.blackLighter,
                size: 20,
              ),
      ),
    );
  }
}
