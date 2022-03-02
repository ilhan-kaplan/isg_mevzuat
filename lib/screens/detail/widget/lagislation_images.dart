import 'package:flutter/material.dart';
import 'package:isg_mevzuat/constants/colors.dart';
import 'package:isg_mevzuat/screens/detail/searching_page.dart';
@immutable
class LegislationImages extends StatelessWidget {
  String choosing = "all";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      _buildLegs(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLegs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mevzuat İçeriği',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: cFont),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Mevzuat içerisinde kelime arayarak ilgili maddeye kolayca ulaşabilirsiniz...',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: cFontLight)),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        _legsImages(),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget _legsImages() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /* GridView.count(
            crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            legislation_extract(bPurple,'assets/images/isg_icon.png','İş Sağlığı ve Güvenliği','isg'),
            legislation_extract(bGreen,'assets/images/is_icon.png','İş Kanunu','is_kanunu'),
            legislation_extract(bOrange,'assets/images/makine_icon.png','Makine Yönetmeliği','makine'),
            legislation_extract(bRed,'assets/images/bykhy_icon.png','Binaların Yangından K.H.Y.','yangin'),
          ],
        ),*/

        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: legislation_extract(bPurple, 'assets/images/isg_icon.png',
                    'İş Sağlığı ve Güvenliği', 'isg'),
              ),
              SizedBox(width: 12,),
              Expanded(
                child: legislation_extract(bGreen, 'assets/images/is_icon.png',
                    'İş Kanunu', 'is_kanunu'),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: legislation_extract(bOrange, 'assets/images/makine_icon.png',
                    'Makine Yönetmelikleri', 'makine'),
              ),
              SizedBox(width: 12,),
              Expanded(
                child: legislation_extract(bRed, 'assets/images/bykhy_icon.png',
                    'Binaların Yangından K.H.Y.', 'bykhy'),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: legislation_extract(bBlue, 'assets/images/elektrik_icon.png',
                    'Elektrik Yönetmelikleri', 'elektrik'),
              ),
              SizedBox(width: 12,),
              Expanded(
                child: legislation_extract(bYellow, 'assets/images/all_icon.png',
                    'Bütün Mevzuat', 'all'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class legislation_extract extends StatelessWidget {
  Color colour;
  String resim;
  String baslik;
  String chosing;

  @immutable
  legislation_extract(this.colour, this.resim, this.baslik, this.chosing);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchingPage(chosing)),
        );
      },
      child: Stack(
        children: [
          Container(
            height: 150,
            //width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: colour,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 1,
            child: SizedBox(height: 120, child: Image.asset(resim)),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: SizedBox(
              width: 150,
              child: Text(
                baslik,
                style: TextStyle(
                    color: cFont, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
