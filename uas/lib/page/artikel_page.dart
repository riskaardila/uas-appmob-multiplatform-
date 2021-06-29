import 'package:flutter/material.dart';
import 'package:uas/models/artikel.dart';

class ArtikelPage extends StatelessWidget {
  final Artikel artikel;

  ArtikelPage({this.artikel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(artikel.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(artikel.urlToImage), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                artikel.source.name,
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              artikel.description,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
