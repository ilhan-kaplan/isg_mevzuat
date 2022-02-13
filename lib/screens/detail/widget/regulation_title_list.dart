
import 'package:flutter/material.dart';
import 'package:isg_mevzuat/constants/colors.dart';
import 'package:isg_mevzuat/models/regulation_titles.dart';

class RegulationTitleList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left:8,right: 8,),
          child: Container(
            child: _buildRagulationTitles(),

          ),
        ),
    );
  }

  Widget _buildRagulationTitles() {
    return ListView.builder(
      itemCount: RegulationTitles.generateRegulationTitles().length,
        itemBuilder: (context,index) {
          return Card(
            child: ListTile(
              title: Text(RegulationTitles.generateRegulationTitles()[index].title),
              subtitle: Text(RegulationTitles.generateRegulationTitles()[index].suntitle),
            ),
            elevation: 2,
            shape:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: cFontLight, width: 1)
            ),
          );
        });
  }

}


