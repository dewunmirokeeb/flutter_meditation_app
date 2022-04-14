import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation_app_ui/constants.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    this.svgscr,
    this.isactive = false,
    this.press,
    this.title,
    Key? key,
  }) : super(key: key);
  final String? svgscr;
  final String? title;
  final Function()? press;
  final bool isactive;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: press!,
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            SvgPicture.asset(
              svgscr!,
            ),
            const Spacer(),
            Text(
              title ?? '',
              style: TextStyle(
                color: isactive ? kActiveIconColor : kTextColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
