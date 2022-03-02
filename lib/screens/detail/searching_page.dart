import 'package:flutter/material.dart';
import 'package:isg_mevzuat/screens/detail/result_page.dart';
import 'package:isg_mevzuat/screens/detail/widget/regulation_title_list.dart';

import '../../constants/colors.dart';
import 'setting_page.dart';

class SearchingPage extends StatefulWidget {
  String chosing;

  SearchingPage(this.chosing);

  @override
  _SearchingPageState createState() => _SearchingPageState();
}

class _SearchingPageState extends State<SearchingPage> {
  String dropdownvalue = 'İSG Mevzuatı';
  String kelime = '';
  int sayac = 0;

  // List of items in our dropdown menu
  var items = [
    'İSG Mevzuatı',
    'İş Kanunu',
    'Makine Yönetmeliği',
    'Binaların Yangından K.H.Y.',
    'Bütün Mevzuat',
  ];

  @override
  Widget build(BuildContext context) {
    if (sayac == 0) {
      switch (widget.chosing) {
        case "isg":
          {
            dropdownvalue = 'İSG Mevzuatı';
            sayac++;
          }
          break;
        case "is_kanunu":
          {
            dropdownvalue = 'İş Kanunu';
            sayac++;
          }
          break;
        case "makine":
          {
            dropdownvalue = 'Makine Yönetmeliği';
            sayac++;
          }
          break;
        case "bykhy":
          {
            dropdownvalue = 'Binaların Yangından K.H.Y.';
            sayac++;
          }
          break;
        default:
          {
            dropdownvalue = 'Bütün Mevzuat';
            sayac++;
          }
          break;
      }
    }

    return Scaffold(
      backgroundColor: cPrimary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(0.0),
                            bottomLeft: Radius.circular(0.0),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset(
                            'assets/images/ana_ekran.png',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    top: 30,
                    right: 10,
                    child: IconButton(
                      icon: const Icon(
                        Icons.settings,
                        size: 24,
                        color: cBackground,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => SettingPage()),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 10,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 22,
                        color: cBackground,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => FirstPage()),);
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, right: 16, top: 16),
                    child: Container(
                      margin: new EdgeInsets.only(top: 60),
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        //color: bGreen,
                      ),
                      child: Column(
                        children: [
                          textfield(),
                          dropdownbutton(),
                          button_search(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 250,
              width: MediaQuery.of(context).size.width,
              child: Container(
                  decoration: BoxDecoration(
                    color: cBackground,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:20,top: 20,bottom: 10),
                        child: Text(dropdownvalue,
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: cFont),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:18.0,bottom: 6),
                        child: Text('Temel Kanun ve Yönetmelikler Listesi;',style: TextStyle(color: cFontLight,fontSize: 12),),
                      ),
                      RegulationTitleList(),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  TextField textfield() {
    return TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white70,
          hintText: 'Kelime Giriniz. Örn; iskele, patlama...',
          contentPadding: const EdgeInsets.all(15),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(width: 2, color: cPrimaryDark),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(width: 2, color: cPrimaryDark),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          )),
      onChanged: (value) {
        kelime = value.toString();
      },
    );
  }

  Padding button_search() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: ElevatedButton(
                child: Text(
                  'Arama Yap',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  setState(() {});

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResultPage(kelime,dropdownvalue)),
                  );

                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(bGreen),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.only(
                            top: 10, bottom: 10, left: 30, right: 30)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ))),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding dropdownbutton() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white70,
            //background color of dropdown button
            border: Border.all(color: cPrimaryDark, width: 2),
            //border of dropdown button
            borderRadius: BorderRadius.circular(50),
            //border raiuds of dropdown button
            boxShadow: <BoxShadow>[
              //apply shadow on Dropdown button
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.57),
                  //shadow for button
                  blurRadius: 5)
              //blur radius of shadow
            ]),
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: DropdownButton(
            // Initial Value
            value: dropdownvalue,
            isExpanded: true,

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
        ),
      ),
    );
  }
}
