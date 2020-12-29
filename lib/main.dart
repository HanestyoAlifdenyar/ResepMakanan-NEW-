import 'package:flutter/material.dart';
import 'package:resepmakanan_app/DetailPage.dart';

import 'DetailPage.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('List Masakan'),
      ),
      body: _PageList(),
    );
  }
}

final baseTextStyle = const TextStyle(color: Colors.white, fontFamily: 'arial');
final bigHeaderTextStyle =
    baseTextStyle.copyWith(fontSize: 24.0, fontWeight: FontWeight.bold);
final descTextStyle =
    baseTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.w400);
final footerTextStyle =
    baseTextStyle.copyWith(fontSize: 14.0, fontWeight: FontWeight.w400);

class _PageList extends StatefulWidget {
  @override
  __PageStateListState createState() => __PageStateListState();
}

class __PageStateListState extends State<_PageList> {
  List<String> judul = [
    'Nasi Goreng',
    'Soto Lamongan',
    'Soto Babat',
    'Pecel Lele',
    'Bakso',
    'Mie Ayam',
    'Rendang',
    'Sate',
    'Klepon',
    'Mie Aceh'
  ];
  List<String> subJudul = [
    'NasiGoreng, dimasak dengan penggorengan',
    'SotoLamongan, dimasak dengan ahli nya',
    'SotoBabat, dimasak dengan professional',
    'PeceLele, dimasak dengan lele',
    'Bakso, dimasak dengan daging sapi',
    'MieAyam, dimasak dengan mie dan ayam',
    'Rendang, dimasak dengan daging dan bumbu rendang',
    'Sate, dimasak dengan cara di bakar',
    'Klepon, dimasak dengan ketan',
    'Mie aceh, dimasak dengan cabai pedas'
  ];
  List<String> gambar = [
    'assets/images/nasigoreng.jpg',
    'assets/images/sotolamongan.jpg',
    'assets/images/sotobabat.jpg',
    'assets/images/pecellele.jpeg',
    'assets/images/bakso.jpeg',
    'assets/images/mieayam.jpeg',
    'assets/images/rendang.jpg',
    'assets/images/sate.jpg',
    'assets/images/klepon.jpg',
    'assets/images/mieaceh.jpg'
  ];
  List<String> jmlh = [
    '20 pcs',
    '20 pcs',
    '20 pcs',
    '20 pcs',
    '20 pcs',
    '20 pcs',
    '20 pcs',
    '20 pcs',
    '20 pcs',
    '20 pcs'
  ];
  List<String> bahan = [
    '- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada',
    '- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada',
    '- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada',
    '- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada',
    '- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada',
    '- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada',
    '- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada',
    '- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada',
    '- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada',
    '- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada\n- Yang pastinya ada'
  ];
  List<String> cara = [
    'Gak usah diajarin lagi la udah tau :)',
    'Gak usah diajarin lagi la udah tau :)',
    'Gak usah diajarin lagi la udah tau :)',
    'Gak usah diajarin lagi la udah tau :)',
    'Gak usah diajarin lagi la udah tau :)',
    'Gak usah diajarin lagi la udah tau :)',
    'Gak usah diajarin lagi la udah tau :)',
    'Gak usah diajarin lagi la udah tau :)',
    'Gak usah diajarin lagi la udah tau :)',
    'Gak usah diajarin lagi la udah tau :)'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: judul.length,
          itemBuilder: (BuildContext contex, int index) {
            final title = judul[index].toString();
            final subTitle = subJudul[index].toString();
            final img = gambar[index].toString();
            final jumlah = jmlh[index].toString();
            final prlkn = bahan[index].toString();
            final how = cara[index].toString();
            return Container(
              height: 200.0,
              padding: EdgeInsets.all(8.0),
              child: GestureDetector(
                  child: Stack(
                    children: <Widget>[
                      backgroundImage(img),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: topContent(title, subTitle, jumlah),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(
                                itemJudul: title,
                                itemSub: subTitle,
                                itemImage: img,
                                qty: jumlah,
                                itemItem: prlkn,
                                itemHow: how)));
                  }),
            );
          }),
    );
  }

  backgroundImage(String gambar) {
    return new Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.luminosity),
              image: AssetImage(gambar))),
    );
  }

  topContent(String nama, String deskripsi, String stok) {
    return new Container(
      height: 80.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            nama,
            style: bigHeaderTextStyle,
          ),
          Text(
            deskripsi,
            style: descTextStyle,
            maxLines: 1,
          ),
          Container(
            height: 2.0,
            width: 80.0,
            color: Colors.redAccent,
          ),
          Text(
            stok,
            style: footerTextStyle,
          ),
        ],
      ),
    );
  }
}
