import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
        ),
      home: Scaffold(
        body: Container(
          width: 302,
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: SandwichContent(),
        ),
      ),
    );
  }
}

class SandwichContent extends StatelessWidget {
  const SandwichContent ({super.key});

  static const Map<String, String> ingredients = {
    "Ciabatta Ekmeği": "40",
    "Sandviç ekmeği": "30",
    "Patates Kızartması": "30",
    "Kaşar Peyniri": "25",
    "Cheadar Peyniri": "35",
    "Beyaz Peynir": "20",
    "Avokado": "50",
    "Domates": "50",
    "Omlet": "45",
    "Haşlanmış Yumurta": "30",
    "Piliç Füme": "60",
    "Salam": "55",
    "100% Göden Dana Sucuk": "70",
    "Marul": "8",
    "Roka": "55",
    "Dilimli Siyah Zeytin": "55",
    "Izgara Zeytin": "55",
    "Zeytin Ezmesi": "55",
    "Kahvaltılık Ezme": "55",
    "Salatalık": "55",
    "Kornişon Turşu": "55",
    "Kırmızı Soğan": "50",
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: const Text(
            'Kendi Sandviçini Yap',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(bottom: 12),
          child: Text("İsim_______________"),
        ),
        ...ingredients.entries.map((entry) {
          return Row(children: [
            SizedBox(width: 24, child: Text(entry.value),),
            Icon(Icons.check_box_outline_blank, size: 30),
            Text("  ${entry.key}"),
          ]);
        }),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 12),
          child: Text("Toplam______________"),
        )
      ],
    );
  }
}
