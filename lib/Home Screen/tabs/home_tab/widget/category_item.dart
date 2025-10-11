import 'package:eventlyapp/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:eventlyapp/generated/l10n.dart';

class CategoryModel {
  final String id; // ثابت للفئة (يستخدم للفلترة)
  final String index;
  final String name;
  final IconData iconData;
  final String? imagePath;

  const CategoryModel({
    required this.id,
    required this.index,
    required this.name,
    required this.iconData,
    this.imagePath,
  });

  static List<CategoryModel> getCategoriesWithAll(BuildContext context) {
    return [
      CategoryModel(
        id: "all",
        index: "0",
        name: S.of(context).all,
        iconData: AntDesign.compass_outline,
      ),
      CategoryModel(
        id: "sport",
        index: "1",
        name: S.of(context).sport,
        iconData: Icons.sports_soccer_outlined,
      ),
      CategoryModel(
        id: "birthday",
        index: "2",
        name: S.of(context).birthday,
        iconData: Icons.cake_outlined,
      ),
      CategoryModel(
        id: "meeting",
        index: "3",
        name: S.of(context).meeting,
        iconData: Icons.meeting_room_outlined,
      ),
      CategoryModel(
        id: "gaming",
        index: "4",
        name: S.of(context).gaming,
        iconData: Icons.sports_esports_outlined,
      ),
      CategoryModel(
        id: "workshop",
        index: "5",
        name: S.of(context).workshop,
        iconData: Icons.build_outlined,
      ),
      CategoryModel(
        id: "bookClub",
        index: "6",
        name: S.of(context).bookClub,
        iconData: Icons.menu_book_outlined,
      ),
      CategoryModel(
        id: "exhibition",
        index: "7",
        name: S.of(context).exhibition,
        iconData: Icons.museum_outlined,
      ),
      CategoryModel(
        id: "holiday",
        index: "8",
        name: S.of(context).holiday,
        iconData: Icons.beach_access_outlined,
      ),
      CategoryModel(
        id: "eating",
        index: "9",
        name: S.of(context).eating,
        iconData: Icons.restaurant_outlined,
      ),
    ];
  }

  static List<CategoryModel> getCategories(BuildContext context) {
    return [
      CategoryModel(
        id: "sport",
        index: "0",
        name: S.of(context).sport,
        iconData: Icons.sports_soccer_outlined,
        imagePath: AppAssets.sportEvent,
      ),
      CategoryModel(
        id: "birthday",
        index: "1",
        name: S.of(context).birthday,
        iconData: Icons.cake_outlined,
        imagePath: AppAssets.birthdayEvent,
      ),
      CategoryModel(
        id: "meeting",
        index: "2",
        name: S.of(context).meeting,
        iconData: Icons.meeting_room_outlined,
        imagePath: AppAssets.meetingimage,
      ),
      CategoryModel(
        id: "gaming",
        index: "3",
        name: S.of(context).gaming,
        iconData: Icons.sports_esports_outlined,
        imagePath: AppAssets.gamingEvent,
      ),
      CategoryModel(
        id: "workshop",
        index: "4",
        name: S.of(context).workshop,
        iconData: Icons.build_outlined,
        imagePath: AppAssets.workshopEvent,
      ),
      CategoryModel(
        id: "bookClub",
        index: "5",
        name: S.of(context).bookClub,
        iconData: Icons.menu_book_outlined,
        imagePath: AppAssets.bookclubEvent,
      ),
      CategoryModel(
        id: "exhibition",
        index: "6",
        name: S.of(context).exhibition,
        iconData: Icons.museum_outlined,
        imagePath: AppAssets.bexhibitionEvent,
      ),
      CategoryModel(
        id: "holiday",
        index: "7",
        name: S.of(context).holiday,
        iconData: Icons.beach_access_outlined,
        imagePath: AppAssets.holidayEvent,
      ),
      CategoryModel(
        id: "eating",
        index: "8",
        name: S.of(context).eating,
        iconData: Icons.restaurant_outlined,
        imagePath: AppAssets.eatingEvent,
      ),
    ];
  }

  static CategoryModel? getCategoryByIndex(String index, BuildContext context) {
    try {
      return getCategoriesWithAll(context).firstWhere(
        (category) => category.index == index,
      );
    } catch (e) {
      return null;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryModel &&
          runtimeType == other.runtimeType &&
          index == other.index;

  @override
  int get hashCode => index.hashCode;

  @override
  String toString() => 'CategoryModel(id: $id, index: $index, name: $name)';
}
