import 'package:eventlyapp/Providers/app_language_provider.dart';
import 'package:eventlyapp/Providers/app_theme_provider.dart';
import 'package:eventlyapp/generated/l10n.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeButtomSheet extends StatefulWidget {
  const ThemeButtomSheet({super.key});

  @override
  State<ThemeButtomSheet> createState() => _LanguageButtomSheetState();
}

class _LanguageButtomSheetState extends State<ThemeButtomSheet> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: height * .02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                themeProvider.changeTheme(ThemeMode.dark);
              },
              child: themeProvider.appTheme == ThemeMode.dark
                  ? getSelectedItem(language: S.of(context).dark)
                  : getUnSelectedItem(language: S.of(context).dark)),
          SizedBox(
            height: height * .02,
          ),
          InkWell(
              onTap: () {
                themeProvider.changeTheme(ThemeMode.light);
              },
              child: themeProvider.appTheme == ThemeMode.light
                  ? getSelectedItem(language: S.of(context).light)
                  : getUnSelectedItem(language: S.of(context).light))
        ],
      ),
    );
  }

  Widget getSelectedItem({required String language}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          language,
          style: AppStyle.bold16Primary,
        ),
        Icon(
          Icons.check,
          color: AppColor.primaryLightColor,
        )
      ],
    );
  }

  Widget getUnSelectedItem({required String language}) {
    return Text(
      language,
      style: AppStyle.bold16Black,
    );
  }
}
