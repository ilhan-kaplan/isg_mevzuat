import 'package:flutter/material.dart';
import 'package:isg_mevzuat/constants/colors.dart';

import '../detail/first_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: Image.asset('assets/images/giris.png'),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Text(
                      'İş Sağlığı ve Güvenliği Mevzuatı',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 34, fontWeight: FontWeight.bold, color: cFont),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Text(
                      'Mevzuat içerisinde kelime arayarak ilgili maddeye kolayca ulaşabilirsiniz...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: cFontLight),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => FirstPage()),
                  );
                },
                child: Container(
                    width: 100,
                    height: 100,
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      size: 44,
                      color: cBackground,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: cAccent,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

}
