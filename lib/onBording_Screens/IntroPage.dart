import 'package:animated_toggle_switch/animated_toggle_switch.dart';
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

class Intropage extends StatefulWidget {
  const Intropage({super.key});

  @override
  State<Intropage> createState() => _IntropageState();
}

class _IntropageState extends State<Intropage> {
  int value = 0;
  int? nullableValue;
  bool positive = false;
  bool loading = false;

  int? _getCurrentLanguageValue(String language) {
    switch (language) {
      case "en":
        return 0;
      case "ar":
        return 1;
      default:
        return null;
    }
  }

  String _getLanguageFromValue(int? value) {
    switch (value) {
      case 0:
        return "en";
      case 1:
        return "ar";
      default:
        return "en";
    }
  }

  int? _getCurrentThemeValue(ThemeMode theme) {
    switch (theme) {
      case ThemeMode.light:
        return 0;
      case ThemeMode.dark:
        return 1;
      default:
        return 0;
    }
  }

  ThemeMode _getThemeFromValue(int? value) {
    switch (value) {
      case 0:
        return ThemeMode.light;
      case 1:
        return ThemeMode.dark;
      default:
        return ThemeMode.light;
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(AppAssets.onbordinglogo),
            SizedBox(
              height: height * 0.02,
            ),
            Image.asset(AppAssets.onbording1),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    S.of(context).Personalize_Your_Experience,
                    style: AppStyle.bold20Primary,
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Text(
                    S.of(context).obBoarding1dc,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).language,
                        style: AppStyle.medium20Primary,
                      ),
                      AnimatedToggleSwitch<int?>.rolling(
                        iconOpacity: 100,
                        allowUnlistedValues: true,
                        styleAnimationType: AnimationType.onHover,
                        current: _getCurrentLanguageValue(
                            languageProvider.appLanguage),
                        values: const [0, 1],
                        onChanged: (i) {
                          final newLanguage = _getLanguageFromValue(i);
                          languageProvider.changeLanguage(newLanguage);
                        },
                        iconBuilder: languageIconBuilder,
                        style: ToggleStyle(
                            backgroundColor: Colors.transparent,
                            borderColor: AppColor.primaryLightColor,
                            borderRadius: BorderRadius.circular(25),
                            indicatorColor: AppColor.primaryLightColor),
                        borderWidth: 3.0,
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).theme,
                        style: AppStyle.medium20Primary,
                      ),
                      AnimatedToggleSwitch<int?>.rolling(
                        iconOpacity: 100,
                        allowUnlistedValues: true,
                        styleAnimationType: AnimationType.onHover,
                        current: _getCurrentThemeValue(themeProvider.appTheme),
                        values: const [0, 1],
                        onChanged: (i) {
                          final newTheme = _getThemeFromValue(i);
                          themeProvider.changeTheme(newTheme);
                        },
                        iconBuilder: themeIconBuilder,
                        style: ToggleStyle(
                            backgroundColor: Colors.transparent,
                            borderColor: AppColor.primaryLightColor,
                            borderRadius: BorderRadius.circular(25),
                            indicatorColor: AppColor.primaryLightColor),
                        borderWidth: 3.0,
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  CustomElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(AppRoutes.introductionScreen);
                      },
                      text: S.of(context).LetsStart)
                ],
              ),
            )
          ],
        ),
      ),
    )));
  }

  Widget languageIconBuilder(int? value, bool foreground) {
    return Container(
      child: Center(
        child: flagByValue(value),
      ),
    );
  }

  Widget themeIconBuilder(int? value, bool foreground) {
    return Container(
      child: Center(
        child: themeIconByValue(value),
      ),
    );
  }

  Widget iconBuilder(int value) {
    return languageIconBuilder(value, false);
  }

  Widget rollingIconBuilder(int? value, bool foreground) {
    return Container(
      child: Center(
        child: flagByValue(value),
      ),
    );
  }

  Color colorBuilder(int value) => switch (value) {
        0 => Colors.blueAccent,
        1 => Colors.red,
        _ => AppColor.primaryLightColor,
      };

  Widget flagByValue(int? value) => switch (value) {
        0 => Flag(
            Flags.united_states_of_america,
            size: 28,
          ),
        1 => Flag(
            Flags.egypt,
            size: 28,
          ),
        _ => Icon(
            Icons.language,
            size: 28,
            color: AppColor.primaryLightColor,
          ),
      };

  Widget themeIconByValue(int? value) => switch (value) {
        0 => Icon(
            Icons.wb_sunny,
            size: 28,
            color: Colors.orange,
          ),
        1 => Icon(
            Icons.nightlight_round,
            size: 28,
            color: Colors.indigo,
          ),
        _ => Icon(
            Icons.brightness_auto,
            size: 28,
            color: AppColor.primaryLightColor,
          ),
      };

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
