import 'package:eventlyapp/Home%20Screen/tabs/home_tab/event_item.dart';
import 'package:eventlyapp/Home%20Screen/tabs/widgets/custom_textformfiled.dart';
import 'package:eventlyapp/generated/l10n.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class FavoriteTab extends StatelessWidget {
  FavoriteTab({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Column(
          children: [
            CustomTextformfiled(
              controller: searchController,
              borderSideColor: AppColor.primaryLightColor,
              hintText: S.of(context).search_for_event,
              hintStyle: AppStyle.bold14Primarylight,
              prefixIcon: Icon(Clarity.search_line),
              prefixIconColor: AppColor.primaryLightColor,
            ),
            Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.only(top: height * 0.02),
                  itemBuilder: (context, index) {
                    return Container();
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: height * 0.01,
                    );
                  },
                  itemCount: 20),
            ),
          ],
        ),
      ),
    );
  }
}
