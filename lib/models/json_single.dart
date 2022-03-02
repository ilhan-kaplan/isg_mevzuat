
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'madde_detay.dart';

class JsonSingle {
  late String madde_id;
  late String kategori;

  JsonSingle(this.madde_id,this.kategori);

   Future<MaddeDetay> maddem(String cevap) async {
     MaddeDetay madde_detayi = MaddeDetay.fromJson(jsonDecode(cevap));
     return madde_detayi;
   }


  Future<MaddeDetay> maddeyiGetir() async {

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
    var url = Uri.parse("https://sunbilisim.com/isg_mevzuat/singe.php");
    var verim = {"madde_id": madde_id, "kategori": kategori};
    var cevap = await http.post(url, body: verim);
    return maddem(cevap.body);
  }

}