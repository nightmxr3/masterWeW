import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  final String title;

  NewPage(this.title);


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Info Korporat'),
      ),
      body: Container(
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.only(top: 8.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Text(''),
                Text(''),
                Text(''),
                Text('Lembaga Pemasaran Pertanian Persekutuan (Federal Agricultural Marketing Authority atau FAMA) merupakan sebuah agensi pemasaran di bawah Kementerian Pertanian dan Industri Asas Tani. FAMA bertanggungjawab dalam pemasaran produk agromakanan seperti sayur-sayuran dan buah-buhan serta produk -produk industri asas tani.',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 19)),
                Text(''),
                Text(''),
                Text('Bagi memacu sektor pemasaran domestik dan antarabangsa, FAMA berperanan dalam pemasaran hasil produk agromakanan dan meningkatkan pendapatan pengeluar. FAMA juga berperanan dalam memastikan produk pertanian dan industri asas tani tersedia dan boleh diperolehi pada harga yang mampu dibayar oleh pengguna. Bagi melaksanakan peranan ini, FAMA telah dan sedang menggiatkan usaha-usaha meningkatkan kecekapan di sepanjang rantaian pemasaran dengan memberi fokus kepada memperkukuhkan bekalan melalui program ladang kontrak, memperluaskan akses pasaran dan meningkatkan promosi pasaran tempatan dan eksport.',
                        style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 19)),
                Text(''),
                Text(''),
                Text(''),
              ]
            ) 
          )
      )
    );
    
  }
}

