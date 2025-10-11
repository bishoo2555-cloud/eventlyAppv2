import 'package:eventlyapp/utils/app_assets.dart';
import 'package:flutter/material.dart';

class MapTab extends StatelessWidget {
  const MapTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(AppAssets.map),
    ));
  }
}
