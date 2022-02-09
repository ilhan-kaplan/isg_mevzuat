import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import 'first_page.dart';
import 'setting_page.dart';

class SearchingPage extends StatefulWidget {

  String chosing;
  SearchingPage(this.chosing);

  @override
  _SearchingPageState createState() => _SearchingPageState();
}

class _SearchingPageState extends State<SearchingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimary,
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 260,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(0.0),
                      bottomLeft: Radius.circular(0.0),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset('assets/images/ana_ekran.png',fit: BoxFit.fitHeight,),
                  ),
                )
              ],
            ),

            Positioned(
              top: 40,
              right: 10,
              child: IconButton(
                icon: const Icon(Icons.settings,size: 24,color: cBackground,),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SettingPage()),);
                },
              ),
            ),
            Positioned(
              top: 40,
              left: 10,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios,size: 22,color: cBackground,),
                onPressed: () {
                  Navigator.pop(context);
                  //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => FirstPage()),);
                },
              ),
            ),

           Row(
             children: [
               Expanded(
                 child: Padding(
                   padding: const EdgeInsets.only(left:16.0,right: 16,top:16),
                   child: Container(
                     margin: new EdgeInsets.only(top:80),
                     height: 150,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(0),
                       color: bGreen,
                     ),
                     child: Column(
                       children: [
                         TextField(
                           decoration: InputDecoration(
                               hintText: 'Kelime Giriniz. Örn; iskele, patlama...',
                               contentPadding: const EdgeInsets.all(15),
                               border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(30))),
                           onChanged: (value) {
                             // do something
                           },
                         ),
                         DropdownButton<String>(
                           items: <String>['A', 'B', 'C', 'D'].map((String value) {
                             return DropdownMenuItem<String>(
                               value: value,
                               child: Text(value),
                             );
                           }).toList(),
                           onChanged: (_) {},
                         ),
                       ],
                     ),
                   ),
                 ),
               ),


             ],
           ),
          ],
        ),
      ),
    );
  }
}
