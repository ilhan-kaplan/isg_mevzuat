import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:isg_mevzuat/constants/colors.dart';
import 'package:isg_mevzuat/models/madde_detay.dart';

class DetailPage extends StatefulWidget {
  MaddeDetay madde;

  DetailPage(this.madde);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SafeArea(
                child: Container(
                  child: Column(
                    children: [
                      Html(data: "<small><b>${widget.madde.kanun_baslik}</b></br><b>${widget.madde.genel_baslik}</br><b>${widget.madde.alt_baslik}</b></small>"),
                      //SizedBox(height: 2,),
                      Html(data: "<pre><small>${widget.madde.madde}</small></pre>"),
                    ],
                  )

                ),
              ),
            ),
          ),
          Positioned(
            top:46,
              right: 20,
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                  child: Icon(Icons.cancel_rounded,color: cFontLight),
              ),
          ),
        ],
      ),
    );
  }
}
