import 'package:flutter/material.dart';
import 'package:flutter_ui_hotel_booking/common/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  final String assets;
  final bool showBadge;
  final Function()? onPressed;
  const CustomIconButton({
    super.key,
    required this.assets,
    this.onPressed,
    this.showBadge = false,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Color(0xffECECEC)),
          ),
        ),
        fixedSize: WidgetStatePropertyAll(Size(40, 40)),
      ),
      icon: showBadge
          ? Badge(
              alignment: Alignment(0.9, -0.9),
              smallSize: 10,
              backgroundColor: AppColors.accentRed,
              child: ImageIcon(AssetImage(assets)),
            )
          : ImageIcon(AssetImage(assets)),
      iconSize: 24,
      color: Color(0xff000000),
    );
  }
}
