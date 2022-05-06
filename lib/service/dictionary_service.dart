import 'dart:convert';
import 'package:flutter_tdk_app/model/sozluk.dart';
import 'package:http/http.dart' as http;

class DictionaryService {
  Future<List<SozlukAnlamlarListe>> searchWord(String word) async {
    Uri url = Uri.parse('https://sozluk.gov.tr/gts?ara=$word');

    final response = await http.get(url);
    List<SozlukAnlamlarListe> anlamList = [];
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      if (result[0] != null) {
        Sozluk sozluk = Sozluk.fromJson(result[0]);

        for (SozlukAnlamlarListe anlam in sozluk.anlamlarListe!) {
          anlamList.add(anlam);
        }
      }
    }
    return anlamList;
  }
}
