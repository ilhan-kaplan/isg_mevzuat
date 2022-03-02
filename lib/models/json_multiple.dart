import 'dart:convert';
import 'package:http/http.dart' as http;
import 'madde_arama_listesi.dart';
import 'madde_detay.dart';

class JsonConnect {

  late String word;
  late String kategori;
  JsonConnect(this.word,this.kategori);

  List<MaddeDetay> maddeler(String cevap) {
    List<MaddeDetay> madde_liste =
        MaddeAramaListesi.fromJson(json.decode(cevap)).madde_listesi;
    print("lenght: " + madde_liste.length.toString());
    return madde_liste;
  }

  Future<List<MaddeDetay>> maddeleriGetir() async {

    switch (kategori) {
      case 'İSG Mevzuatı':
        {
          kategori = 'isg';
        }
        break;
      case "İş Kanunu":
        {
          kategori = 'is_kanunu';
        }
        break;
      case "Makine Yönetmeliği":
        {
          kategori = 'makine';
        }
        break;
      case "Binaların Yangından K.H.Y.":
        {
          kategori = 'bykhy';
        }
        break;
      default:
        {
          kategori = 'all';
        }
        break;
    }
    var url = Uri.parse("https://sunbilisim.com/isg_mevzuat/${kategori}.php");
    var verim = {"kelime": word, "kategori": kategori};
    var cevap = await http.post(url, body: verim);
    return maddeler(cevap.body);
  }

}