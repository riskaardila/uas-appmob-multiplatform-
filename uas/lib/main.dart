import 'package:flutter/material.dart';
import 'package:uas/compenent/custom.dart';
import 'package:uas/servis/api_servis.dart';
import 'package:uas/models/artikel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riska Ardila",
            textAlign: TextAlign.center, style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Artikel>> snapshot) {
          if (snapshot.hasData) {
            List<Artikel> articles = snapshot.data;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) =>
                  customList(articles[index], context),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
