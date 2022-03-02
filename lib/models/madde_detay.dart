class MaddeDetay{
  String kanun_baslik;
  String yayin_tarihi;
  String bolum;
  String genel_baslik;
  String alt_baslik;
  String madde;
  String madde_id;
  String alt_kategori;
  String kategori;

  MaddeDetay(
      this.kanun_baslik,
      this.yayin_tarihi,
      this.bolum,
      this.genel_baslik,
      this.alt_baslik,
      this.madde,
      this.madde_id,
      this.alt_kategori,
      this.kategori,
      );

  factory MaddeDetay.fromJson(Map<String,dynamic> json){
    return MaddeDetay(
      json['kanun_baslik'] as String,
      json['yayin_tarihi'] as String,
      json['bolum'] as String,
      json['genel_baslik'] as String,
      json['alt_baslik'] as String,
      json['madde'] as String,
      json['madde_id'] as String,
      json['alt_kategori'] as String,
      json['kategori'] as String,
    );

  }
}