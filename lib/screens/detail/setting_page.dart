import 'package:flutter/material.dart';
import 'package:isg_mevzuat/screens/detail/widget/setting_content.dart';
import 'package:isg_mevzuat/screens/detail/widget/setting_custom_appbar.dart';

import '../../constants/colors.dart';

class SettingPage extends StatefulWidget {


  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimary,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SettingCustomBar(),
          SizedBox(height: 0,),
          SettingContent(),
        ],
      ),
    );
  }
}
