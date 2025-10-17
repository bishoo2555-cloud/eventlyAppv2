import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventlyapp/Home%20Screen/tabs/home_tab/event_item.dart';
import 'package:eventlyapp/Home%20Screen/tabs/widgets/custom_textformfiled.dart';
import 'package:eventlyapp/firebase/add_event_moder.dart';
import 'package:eventlyapp/firebase/firebase_utils.dart';
import 'package:eventlyapp/generated/l10n.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class FavoriteTab extends StatefulWidget {
  FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  TextEditingController searchController = TextEditingController();
  String query = '';

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        query = searchController.text.trim().toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

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
                      snapshot.data?.docs.map((doc) => doc.data()).toList() ??
                          [];
                  events = events.where((e) => e.isFav).toList();

                  if (query.isNotEmpty) {
                    events = events
                        .where((e) =>
                            e.title.toLowerCase().contains(query) ||
                            e.decription.toLowerCase().contains(query) ||
                            e.eventName.toLowerCase().contains(query))
                        .toList();
                  }

                  events.sort(
                      (a, b) => a.eventdateTime.compareTo(b.eventdateTime));

                  if (events.isEmpty) {
                    return const Center(
                      child: Text('No favorites FOUND ',
                          style: TextStyle(fontSize: 16)),
                    );
                  }

                  return ListView.separated(
                    padding: EdgeInsets.only(top: height * 0.02),
                    itemCount: events.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: height * 0.01),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.00),
                        child: EventItem(event: events[index]),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
