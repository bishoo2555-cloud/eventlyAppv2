import 'package:eventlyapp/generated/l10n.dart';
import 'package:eventlyapp/utils/app_assets.dart';
import 'package:eventlyapp/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddTime_date extends StatelessWidget {
  AddTime_date(
      {super.key,
      required this.iconPath,
      required this.text,
      required this.choose_timeOrdate,
      required this.onChooseEventDateOrTime});

  final String iconPath;
  final String text;
  final String choose_timeOrdate;
  final VoidCallback onChooseEventDateOrTime;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          color: Theme.of(context).indicatorColor,
        ),
        SizedBox(
          width: width * 0.02,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Spacer(),
        TextButton(
            child: Text(
              choose_timeOrdate,
              style: AppStyle.medium16Primary,
            ),
            onPressed: () {
              //todo choose time
              onChooseEventDateOrTime();
            }),
      ],
    );
  }
}
