import 'package:eventlyapp/Providers/app_language_provider.dart';
import 'package:eventlyapp/generated/l10n.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageButtomSheet extends StatefulWidget {
  const LanguageButtomSheet({super.key});

  @override
  State<LanguageButtomSheet> createState() => _LanguageButtomSheetState();
}

class _LanguageButtomSheetState extends State<LanguageButtomSheet> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: height * .02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                languageProvider.changeLanguage("en");
              },
              child: languageProvider.appLanguage == "en"
                  ? getSelectedItem(language: S.of(context).english)
                  : getUnSelectedItem(language: S.of(context).english)),
          SizedBox(
            height: height * .02,
          ),
          InkWell(
              onTap: () {
                languageProvider.changeLanguage("ar");
              },
              child: languageProvider.appLanguage == "ar"
                  ? getSelectedItem(language: S.of(context).arabic)
                  : getUnSelectedItem(language: S.of(context).arabic))
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
