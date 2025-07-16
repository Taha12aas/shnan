import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chnan/utils/const.dart';
import 'package:chnan/utils/box_shado.dart';
import 'package:chnan/utils/font_style.dart';
import 'package:chnan/utils/responsive_text.dart';

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
    return LayoutBuilder(
      builder: (context, constraints) {
        final double size = constraints.maxWidth * 0.3;
        final double iconSize = size * 0.6;

        return InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          splashColor: kAppColor.withOpacity(0.2),
          highlightColor: kAppColor.withOpacity(0.1),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [bosShadow()],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    color: kAppColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      icon,
                      width: iconSize,
                      height: iconSize,
                      color: kAppColor,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Flexible(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: FontStyleApp.black18.copyWith(
                      fontSize: getResponsiveText(context, 14),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
