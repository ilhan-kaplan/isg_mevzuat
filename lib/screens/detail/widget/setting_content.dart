import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class SettingContent extends StatefulWidget {
  @override
  _SettingContentState createState() => _SettingContentState();
}

class _SettingContentState extends State<SettingContent> {
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
            child: buildColumn(),
          ),
        ),
      ],
    );
  }

  SingleChildScrollView buildColumn() {

    Future<void> _showDialogLeg(BuildContext context) async {
      return showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return buildAlertDialogLeg(context);
          });
    };

    Future<void> _showDialogSub(BuildContext context) async {
      return showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return buildAlertDialogSub(context);
          });
    };

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 26.0),
            child: Text(
              'Genel Bilgiler',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16, color: cFont),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 18, right: 18),
            child: SizedBox(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: bRed,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Mevzuat Güncelleme Bilgileri',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: cFont),
                            ),
                            Text(
                              'Tüm mevzuat güncellemeleri tamdır.',
                              style: TextStyle(fontSize: 16, color: cFont),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                _showDialogLeg(context);
                                debugPrint('Mevzuat Güncelleme Click');
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0))),
                                  side: MaterialStateProperty.all(BorderSide(
                                      color: cPrimaryDark,
                                      width: 1.0,
                                      style: BorderStyle.solid))),
                              child: const Text(
                                'Güncellemeleri Kontrol Et...',
                                style: TextStyle(
                                    color: cPrimaryDark, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //child: Image.asset("assets/images/isg_icon.png"),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 18, right: 18),
            child: SizedBox(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: bGreen,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Yıllık abonelik bilgileri',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: cFont),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 18.0, right: 18),
                              child: Text(
                                'Yıllık abonelik başlatılmamıştır. Demo sürümü kullanılıyor.',
                                style: TextStyle(fontSize: 16, color: cFont),
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                _showDialogSub(context);
                                debugPrint('Abonelik click');
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0))),
                                  side: MaterialStateProperty.all(BorderSide(
                                      color: cPrimaryDark,
                                      width: 1.0,
                                      style: BorderStyle.solid))),
                              child: const Text(
                                'Abone Ol...',
                                style: TextStyle(
                                    color: cPrimaryDark, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //child: Image.asset("assets/images/isg_icon.png"),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: 70,
                      child: Image.asset('assets/images/sunbilisim.png')),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Bu uygulama Sun Bilişim Tarafından yapılmıştır.',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: cFont,
                    ),
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AlertDialog buildAlertDialogLeg(BuildContext context) {
    return AlertDialog(
      title: Text('Mevzuat Güncellemesi'),
      titleTextStyle:
          TextStyle(color: cFont, fontSize: 20, fontWeight: FontWeight.bold),
      content: Text(
        'Mevzuat Güncellemeleri Kontrol Ediliyor Lütfen Bekleyiniz...',
        style: TextStyle(color: cFontLight, fontSize: 16),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Durdur',
              style: TextStyle(
                  color: bRed, fontWeight: FontWeight.bold, fontSize: 16),
            )),
      ],
    );
  }

  AlertDialog buildAlertDialogSub(BuildContext context) {
    return AlertDialog(
      title: Text('Abonelik Sayfası'),
      titleTextStyle:
          TextStyle(color: cFont, fontSize: 20, fontWeight: FontWeight.bold),
      content:
          Text(
            'Yıllık abonelik sonucu tüm kısıtlamalar kaldırılır ve tam sürüm olarak kullanabilirsiniz.\n '
                'Yıllık Abonelik Ücreti: 109 TL',
            style: TextStyle(color: cFontLight, fontSize: 16),
          ),

      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Ödeme Yap',
              style: TextStyle(
                  color: bGreen, fontWeight: FontWeight.bold, fontSize: 16),
            )),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Çık',
              style: TextStyle(
                  color: bRed, fontSize: 16),
            )),
      ],
    );
  }
}
