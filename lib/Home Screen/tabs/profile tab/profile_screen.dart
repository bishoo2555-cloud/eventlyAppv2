import 'package:eventlyapp/Home%20Screen/tabs/profile%20tab/Theme/Theme_buttom_sheet.dart';
import 'package:eventlyapp/Home%20Screen/tabs/profile%20tab/language/language_buttom_sheet.dart';
import 'package:eventlyapp/Home%20Screen/tabs/widgets/custom_elevated_button.dart';
import 'package:eventlyapp/Providers/app_language_provider.dart';
import 'package:eventlyapp/Providers/app_theme_provider.dart';
import 'package:eventlyapp/generated/l10n.dart';
import 'package:eventlyapp/utils/app_assets.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_routes.dart';
import 'package:eventlyapp/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryLightColor,
        toolbarHeight: height * .18,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(55))),
        title: Row(
          children: [
            Image.asset(AppAssets.routeImages),
            SizedBox(
              width: width * .04,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Route Academy",
                  style: AppStyle.bold24White,
                ),
                Text(
                  "Route@gmail.com",
                  style: AppStyle.bold16White,
                )
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: height * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              S.of(context).language,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            InkWell(
              onTap: () {
                ShowLanguageButtonSheet();
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width * .03, vertical: height * .01),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColor.primaryLightColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      languageProvider.appLanguage == "en"
                          ? S.of(context).english
                          : S.of(context).arabic,
                      style: AppStyle.bold20Primary,
                    ),
                    Icon(
                      Icons.arrow_drop_down_outlined,
                      size: 35,
                      color: AppColor.primaryLightColor,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              S.of(context).theme,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            InkWell(
              onTap: () {
                showThemeButtomSheet();
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width * .03, vertical: height * .01),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColor.primaryLightColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      themeProvider.appTheme == ThemeMode.dark
                          ? S.of(context).dark
                          : S.of(context).light,
                      style: AppStyle.bold20Primary,
                    ),
                    Icon(
                      Icons.arrow_drop_down_outlined,
                      size: 35,
                      color: AppColor.primaryLightColor,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            CustomElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.loginScreen,
                  (route) => false,
                );
              },
              text: S.of(context).logout,
              textStyle: AppStyle.bold20White,
              backgroundColor: AppColor.logoutColor,
              hasIcon: true,
              iconWidget: Padding(
                padding: EdgeInsetsDirectional.only(start: width * 0.04),
                child: Icon(
                  Icons.logout,
                  color: AppColor.whiteColor,
                  size: 25,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void ShowLanguageButtonSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageButtomSheet());
  }

  void showThemeButtomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeButtomSheet());
  }
}
/*    ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.logoutColor,
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: AppColor.primaryLightbgColor,
                      size: 25,
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text(
                      S.of(context).logout,
                      style: AppStyle.bold20White,
                    )
                  ],
                ))*/
