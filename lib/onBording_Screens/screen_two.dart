import 'package:eventlyapp/generated/l10n.dart';
import 'package:eventlyapp/utils/app_assets.dart';
import 'package:eventlyapp/utils/app_style.dart';
import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: height * 0.02,
        ),
        Image.asset(AppAssets.onbording3),
        SizedBox(
          height: height * 0.02,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              S.of(context).Effortless_Event_Planning,
              style: AppStyle.bold20Primary,
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Text(
              S.of(context).obBoarding3dc,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        )
      ],
    );
  }
}
