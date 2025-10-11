import 'package:eventlyapp/Home%20Screen/tabs/home_tab/widget/category_item.dart';
import 'package:flutter/material.dart';

class EventTabItem extends StatelessWidget {
  EventTabItem({
    super.key,
    required this.isSelected,
    required this.selectedBgColor,
    required this.selectedFgColor,
    required this.unSelectedBgColor,
    required this.unSelectedFgColor,
    required this.category,
  });

  final Color selectedBgColor;
  final Color selectedFgColor;
  final Color unSelectedBgColor;
  final Color unSelectedFgColor;
  final bool isSelected;
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * .06, vertical: height * 0.008),
      decoration: BoxDecoration(
          color: isSelected ? selectedBgColor : unSelectedBgColor,
          borderRadius: BorderRadius.circular(46),
          border: Border.all(
            color: selectedBgColor,
            width: 2,
          )),
      child: Row(
        children: [
          Icon(
            category.iconData,
            color: isSelected ? selectedFgColor : unSelectedFgColor,
          ),
          SizedBox(
            width: width * 0.02,
          ),
          Text(category.name,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? selectedFgColor : unSelectedFgColor))
        ],
      ),
    );
  }
}
