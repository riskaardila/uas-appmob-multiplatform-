
import 'source.dart';

class Artikel {
  final String author;
  final String title;
  final String image;
  final String subtitle;

  Artikel({this.author, this.title, this.image, this.subtitle});

  factory Artikel.fromJson(Map<String, dynamic> json) {
    return Artikel(
      author: json["author"],
      title: json['title'],
      image: json['image'],
      subtitle: json['subtitle'],
    );
  }
}
