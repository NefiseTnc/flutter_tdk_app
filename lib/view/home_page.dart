import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tdk_app/model/sozluk.dart';
import 'package:flutter_tdk_app/service/dictionary_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DictionaryService _service = DictionaryService();
  List<SozlukAnlamlarListe> anlamlarList = [];
  TextEditingController wordCntr = TextEditingController();
  bool? state;
  List<String> sozcuk = [];

  @override
  Widget build(BuildContext context) {
    debugPrint('çalıştı');
    return Scaffold(
      appBar: buildAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildSearchTextField(),
            const SizedBox(height: 20),
            Expanded(child: buildMeaningsListviewBuilder()),
            buildSignListviewBuilder(),
          ],
        ),
      ),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      title: Image.asset(
        'assets/tdk_logo.png',
        width: 50,
        height: 50,
      ),
      centerTitle: true,
    );
  }

  Widget buildSearchTextField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(.2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: wordCntr,
        decoration: InputDecoration(
          hintText: 'Hangi kelimeyi aramak istiyorsunuz?',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16.0),
          suffixIcon: IconButton(
              onPressed: () async {
                if (wordCntr.text.isNotEmpty) {
                  anlamlarList = await _service.searchWord(wordCntr.text);
                  if (anlamlarList.isEmpty) {
                    state = false;
                  } else {
                    state = true;
                    sozcuk = (wordCntr.text.toLowerCase()).split('');
                  }
                  setState(() {});
                }
              },
              icon: const Icon(Icons.search)),
        ),
      ),
    );
  }

  Widget buildMeaningsListviewBuilder() {
    if (state == null) {
      return const Center(
        child: Text('Kelime arayınız..'),
      );
    } else if (state == true) {
      return ListView.builder(
        itemCount: anlamlarList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text('${index + 1}'),
              ),
              title: Text('${anlamlarList[index].anlam}'),
            ),
          );
        },
      );
    } else {
      return const Center(
        child: Text('Aranan kelime bulunamadı.Lütfen tekrar deneyiniz.'),
      );
    }
  }

  Widget buildSignListviewBuilder() {
    return state == true
        ? SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sozcuk.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Card(
                      child: Image.network(
                          'https://sozluk.gov.tr/assets/img/isaret/${sozcuk[index]}.gif'),
                    ),
                    Text(
                      sozcuk[index].toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              },
            ),
          )
        : const SizedBox();
  }
}
