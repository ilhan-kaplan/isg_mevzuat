import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:isg_mevzuat/constants/colors.dart';
import 'package:isg_mevzuat/models/regulation_titles.dart';
import 'package:isg_mevzuat/screens/detail/widget/result_content.dart';
import 'package:isg_mevzuat/screens/detail/widget/setting_custom_appbar.dart';

class ResultPage extends StatefulWidget {

  String kelime;
  String dropdownvalue;
  ResultPage(this.kelime,this.dropdownvalue);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimary,
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top:0,
              right: 0,
              child: SettingCustomBar('Arama Sonuçları','result'),
            ),
            Positioned(
              top:160,
              right: 0,
              child:ResultContent(widget.kelime,widget.dropdownvalue),
            ),


          ],
        ),
      ),
    );
  }
}
