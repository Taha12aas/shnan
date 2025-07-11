import 'package:chnan/utils/box_shado.dart';
import 'package:chnan/utils/const.dart';
import 'package:chnan/utils/font_style.dart';
import 'package:chnan/utils/responsive_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  final String text;
  final String icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    double boxWidth = MediaQuery.sizeOf(context).width * .20;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: boxWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: boxWidth,
              height: boxWidth,
              decoration: BoxDecoration(
                boxShadow: [bosShadow()],
                borderRadius: BorderRadius.circular(5),
                color: kWhite,
              ),
              child: Center(
                child: SvgPicture.asset(
                  icon,
                  width: 35,
                  height: 35,
                  // ignore: deprecated_member_use
                  color: kAppColor,
                ),
              ),
            ),
            const SizedBox(height: 6),
            FittedBox(
              child: Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,

                  style: FontStyleApp.black18.copyWith(
                    fontSize: getResponsiveText(context, 12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
