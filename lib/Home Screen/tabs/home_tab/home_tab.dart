import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventlyapp/Home%20Screen/tabs/home_tab/event_item.dart';
import 'package:eventlyapp/Home%20Screen/tabs/home_tab/widget/event_tab_item.dart';
import 'package:eventlyapp/Providers/app_language_provider.dart';
import 'package:eventlyapp/Providers/app_theme_provider.dart';
import 'package:eventlyapp/Providers/user_provider.dart';
import 'package:eventlyapp/firebase/add_event_moder.dart';
import 'package:eventlyapp/firebase/firebase_utils.dart';
import 'package:eventlyapp/generated/l10n.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Home Screen/tabs/home_tab/widget/category_item.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var categories = CategoryModel.getCategoriesWithAll(context);
    var selectedCategoryId = categories[selectedIndex].id;
    var userProvider = Provider.of<UserProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).welcome_back,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  userProvider.currentUser!.name,
                  style: AppStyle.bold24White,
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    themeProvider.toggleTheme();
                  },
                  icon: Icon(
                    themeProvider.isDarkMode
                        ? Icons.dark_mode
                        : Icons.light_mode,
                    color: AppColor.primaryLightbgColor,
                  ),
                ),
                Card(
                  color: AppColor.primaryLightbgColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: InkWell(
                      onTap: () {
                        if (languageProvider.appLanguage == "en") {
                          languageProvider.changeLanguage("ar");
                        } else {
                          languageProvider.changeLanguage("en");
                        }
                      },
                      child: Text(
                        languageProvider.appLanguage == "en" ? "EN" : "AR",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.011, horizontal: width * .03),
            height: height * .13,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.location_on,
                        color: AppColor.primaryLightbgColor),
                    Text(S.of(context).alexandria,
                        style: AppStyle.reglur16White),
                  ],
                ),
                SizedBox(height: height * 0.02),
                DefaultTabController(
                  length: categories.length,
                  child: TabBar(
                    labelPadding:
                        EdgeInsets.symmetric(horizontal: width * 0.02),
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    tabAlignment: TabAlignment.start,
                    tabs: categories
                        .map(
                          (category) => EventTabItem(
                            isSelected:
                                selectedIndex == categories.indexOf(category),
                            selectedBgColor: Theme.of(context).focusColor,
                            selectedFgColor: Theme.of(context).canvasColor,
                            unSelectedBgColor: Colors.transparent,
                            unSelectedFgColor: AppColor.primaryLightbgColor,
                            category: category,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: StreamBuilder<QuerySnapshot<EventModel>>(
              stream: FirebaseAuth.instance.currentUser == null
                  ? const Stream.empty()
                  : FireBaseUtils.getEvent(
                          FirebaseAuth.instance.currentUser!.uid)
                      .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                var events =
                    snapshot.data?.docs.map((doc) => doc.data()).toList() ?? [];

                if (selectedCategoryId != "all") {
                  events = events
                      .where((e) => e.categoryId == selectedCategoryId)
                      .toList();
                }

                events
                    .sort((a, b) => a.eventdateTime.compareTo(b.eventdateTime));

                if (events.isEmpty) {
                  return const Center(
                      child: Text('No events found right now :(',
                          style: TextStyle(fontSize: 16)));
                }

                return ListView.separated(
                  padding: EdgeInsets.only(top: height * 0.02),
                  itemCount: events.length,
                  separatorBuilder: (context, index) =>
                      SizedBox(height: height * 0.01),
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                        child: InkWell(
                            onTap: () {
                              // هنا باقي كود showModalBottomSheet
                            },
                            child: EventItem(event: events[index])));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
