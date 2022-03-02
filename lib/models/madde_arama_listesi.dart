import 'package:isg_mevzuat/models/madde_detay.dart';

class MaddeAramaListesi{
  List<MaddeDetay> madde_listesi;

  MaddeAramaListesi(this.madde_listesi);

  factory MaddeAramaListesi.fromJson(Map<String,dynamic> json){
    var jsonArray = json['arama'] as List;
    List<MaddeDetay> madde_listesi = jsonArray.map((jsonListesi) => MaddeDetay.fromJson(jsonListesi)).toList();
    return MaddeAramaListesi(madde_listesi);
  }

}