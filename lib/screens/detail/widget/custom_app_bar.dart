import 'package:flutter/material.dart';
import 'package:isg_mevzuat/constants/colors.dart';
import 'package:isg_mevzuat/screens/detail/setting_page.dart';

class CostumAppBar extends StatelessWidget {

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
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset('assets/images/ana_ekran.png',fit: BoxFit.fitWidth ,),
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
            bottom: 20,
              left: 20,
              child: SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('İş Sağlığı',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: cBackground),),
                    Text('ve Güvenliği',
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
