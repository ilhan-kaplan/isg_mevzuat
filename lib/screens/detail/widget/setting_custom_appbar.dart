import 'package:flutter/material.dart';
import 'package:isg_mevzuat/screens/detail/first_page.dart';

import '../../../constants/colors.dart';
import '../setting_page.dart';

class SettingCustomBar extends StatelessWidget {

   String baslik;
   String ayar;
   SettingCustomBar(this.baslik,this.ayar);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width:MediaQuery.of(context).size.width,
                height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(0.0),
                    bottomLeft: Radius.circular(0.0),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset('assets/images/ana_ekran.png',fit: BoxFit.fitWidth,),
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
                if(ayar == 'ayar'){

                }else{
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SettingPage()),);
                }

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
          Positioned(
            bottom: 20,
            left: 20,
            child: SizedBox(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(baslik,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: cBackground),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
