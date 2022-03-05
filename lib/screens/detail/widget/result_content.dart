
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html_unescape/html_unescape_small.dart';
import 'package:isg_mevzuat/screens/detail/detail_page.dart';
import 'package:isg_mevzuat/models/json_multiple.dart';
import 'package:share_plus/share_plus.dart';
import '../../../constants/colors.dart';
import '../../../models/madde_detay.dart';
import '../../../models/pdf_creator.dart';

class ResultContent extends StatefulWidget {
  String kelime;
  String dropdownvalue;


  ResultContent(this.kelime, this.dropdownvalue);

  @override
  _ResultContentState createState() => _ResultContentState();
}

class _ResultContentState extends State<ResultContent> {
  late List<MaddeDetay> madde_detay_save;
  Color clrBlk = Colors.black;
  Color clrGrn = Colors.lightGreen;
  String follow = 'black';

  @override
  Widget build(BuildContext context) {



    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - 160,
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: BoxDecoration(
              color: cBackground,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: FutureBuilder<List<MaddeDetay>>(
              future: JsonConnect(widget.kelime,widget.dropdownvalue).maddeleriGetir(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  //var madde_liste = snapshot.hasData;
                  var number = snapshot.data?.length;
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 10, right: 10),
                        child: Container(
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: number,
                              itemBuilder: (context, index) {
                                MaddeDetay madde = snapshot.data![index];
                                return Stack(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  DetailPage(madde)),
                                        );
                                      },
                                      child: Card(
                                        child: ListTile(
                                          title: Html(
                                              data:
                                                  "<small><b>${madde.kanun_baslik}</b></br><b>${madde.genel_baslik}</br><b>${madde.alt_baslik}</b></small>"),
                                          subtitle: Column(children: [
                                            Html(
                                                data:
                                                    "<pre><small>${madde.madde}</small></pre>"),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ]),
                                        ),
                                        elevation: 2,
                                        shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: cFontLight, width: 1),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 7,
                                      left: 7,
                                      child: SizedBox(
                                        width: 14,
                                        height: 14,
                                        child: CircleAvatar(
                                          backgroundColor: cFontLight,
                                          child: Text(
                                            (index + 1).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 10,
                                        right: 20,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: const BorderRadius
                                                    .all(
                                                const Radius.circular(20.0)),
                                            color: Colors.black12,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 8.0,
                                                bottom: 8,
                                                left: 14,
                                                right: 14),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    String kanun_baslik = madde.kanun_baslik.replaceAll('<span style="color:#DC143C;"><b>${widget.kelime}</b></span>', '${widget.kelime}').toString();
                                                    String genel_baslik = madde.genel_baslik.replaceAll('<span style="color:#DC143C;"><b>${widget.kelime}</b></span>', '${widget.kelime}').toString();
                                                    String alt_baslik = madde.alt_baslik.replaceAll('<span style="color:#DC143C;"><b>${widget.kelime}</b></span>', '${widget.kelime}').toString();
                                                    String maddem = madde.madde.replaceAll('<span style="color:#DC143C;"><b>${widget.kelime}</b></span>', '${widget.kelime}').toString();

                                                    final pdfFile = await PdfApi.generateCenteredText(widget.kelime,kanun_baslik.trim(),genel_baslik.trim(),alt_baslik.trim(),maddem.trim());
                                                    PdfApi.openFile(pdfFile);
                                                  },
                                                  child: Icon(
                                                    Icons.picture_as_pdf,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 14,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    String kanun_baslik = madde.kanun_baslik.replaceAll('<span style="color:#DC143C;"><b>${widget.kelime}</b></span>', '${widget.kelime}');
                                                    String genel_baslik = madde.genel_baslik.replaceAll('<span style="color:#DC143C;"><b>${widget.kelime}</b></span>', '${widget.kelime}');
                                                    String alt_baslik = madde.alt_baslik.replaceAll('<span style="color:#DC143C;"><b>${widget.kelime}</b></span>', '${widget.kelime}');
                                                    String maddem = madde.madde.replaceAll('<span style="color:#DC143C;"><b>${widget.kelime}</b></span>', '${widget.kelime}');


                                                    Share.share(kanun_baslik+'\n'+genel_baslik+'\n'+alt_baslik+'\n'+maddem,subject: 'Aranan Kelime: '+ widget.kelime + ' ');
                                                  },
                                                  child: Icon(
                                                    Icons.share,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 14,
                                                ),
                                               /* GestureDetector(
                                                  onTap: () {
                                                    //madde_detay_save.add(madde);
                                                    setState(() {
                                                     /* if(clrBlk == Colors.black){
                                                        print('black');
                                                        this.clrBlk = Colors.green;
                                                      }else{
                                                        this.clrBlk = Colors.black;
                                                        print('Green');
                                                      }*/

                                                    });

                                                  },
                                                  child: Icon(
                                                    Icons.save_alt_sharp,
                                                    color: clrBlk,
                                                  ),
                                                ),*/
                                              ],
                                            ),
                                          ),
                                        )),
                                  ],
                                );
                              }),
                        ),
                      ),
                      Positioned(
                          top: 0,
                          left: 0,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30.0),
                                  topLeft: Radius.circular(30.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 38.0, top: 8, bottom: 2),
                                child: Text(
                                  '${widget.dropdownvalue} \nKelime: ${widget.kelime} Sonuç: ${snapshot.data?.length}',
                                  style: TextStyle(
                                      color: cFontLight,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )),
                    ],
                  );
                }

                return Center(
                  child: Container(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      color: bGreen,
                    ),
                  ),
                );
              },
            ),
            //buildColumn(),
          ),
        ),
      ],
    );
  }
}
