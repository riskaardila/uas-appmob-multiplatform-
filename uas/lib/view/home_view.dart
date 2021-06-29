import 'package:flutter/material.dart';
import 'package:uas/servis/api_servis.dart';
import 'package:uas/models/artikel.dart';
import 'package:uas/compenent/custom.dart';

class HomeView extends StatefulWidget {
  final Artikel artikel;

  const HomeView({Key key, this.artikel}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<List<Artikel>> artikel;

  @override
  void initState() {
    super.initState();
    artikel = ApiServis().getArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Riska Ardila"),
      ),
      body: FutureBuilder(
        future: artikel,
        builder: (context, snapshot) 
        {
          if (snapshot.hasData) {
            List<Artikel> listArtikel = snapshot.data;
            return ListView.builder(
              itemCount: listArtikel.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => customList(listArtikel[index], context),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
