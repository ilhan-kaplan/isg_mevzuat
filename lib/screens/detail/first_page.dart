import 'package:flutter/material.dart';
import 'package:isg_mevzuat/constants/colors.dart';
import 'package:isg_mevzuat/screens/detail/widget/custom_app_bar.dart';
import 'package:isg_mevzuat/screens/detail/widget/lagislation_images.dart';

class FirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimary,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           CostumAppBar(),
           SizedBox(height: 0,),
           LegislationImages(),

        ],
      ),
    );
  }
}
