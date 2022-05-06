class Sozluk {
/*
{
  "anlamlarListe": [
    {
      "anlam_id": "85557",
      "madde_id": "65452",
      "anlam_sira": "1",
      "fiil": "0",
      "tipkes": "0",
      "anlam": "Bir kimsenin, bir topluluğun doğal veya sonradan kazanılmış yeteneklerini, bilgi ve becerilerini ölçmeye ve anlamaya yarayan sınama"
    }
  ]
} 
*/

  List<SozlukAnlamlarListe>? anlamlarListe;

  Sozluk({
    this.anlamlarListe,
  });
  Sozluk.fromJson(Map<String, dynamic> json) {
    if (json['anlamlarListe'] != null) {
      final v = json['anlamlarListe'];
      final arr0 = <SozlukAnlamlarListe>[];
      v.forEach((v) {
        arr0.add(SozlukAnlamlarListe.fromJson(v!));
      });
      anlamlarListe = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (anlamlarListe != null) {
      final v = anlamlarListe;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v.toJson());
      }
      data['anlamlarListe'] = arr0;
    }
    return data;
  }
}

class SozlukAnlamlarListe {
/*
{
  "anlam_id": "85557",
  "madde_id": "65452",
  "anlam_sira": "1",
  "fiil": "0",
  "tipkes": "0",
  "anlam": "Bir kimsenin, bir topluluğun doğal veya sonradan kazanılmış yeteneklerini, bilgi ve becerilerini ölçmeye ve anlamaya yarayan sınama"
} 
*/

  String? anlamId;
  String? maddeId;
  String? anlamSira;
  String? fiil;
  String? tipkes;
  String? anlam;

  SozlukAnlamlarListe({
    this.anlamId,
    this.maddeId,
    this.anlamSira,
    this.fiil,
    this.tipkes,
    this.anlam,
  });
  SozlukAnlamlarListe.fromJson(Map<String, dynamic> json) {
    anlamId = json['anlam_id']?.toString();
    maddeId = json['madde_id']?.toString();
    anlamSira = json['anlam_sira']?.toString();
    fiil = json['fiil']?.toString();
    tipkes = json['tipkes']?.toString();
    anlam = json['anlam']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['anlam_id'] = anlamId;
    data['madde_id'] = maddeId;
    data['anlam_sira'] = anlamSira;
    data['fiil'] = fiil;
    data['tipkes'] = tipkes;
    data['anlam'] = anlam;
    return data;
  }
}
