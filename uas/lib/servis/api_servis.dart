import 'dart:convert';
import 'package:http/http.dart';
import 'package:uas/models/artikel.dart';

class ApiServis {
  final endPointUrl ="https://jaroji.web.id/api/news.php";

  Future<List<Artikel>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['berita'];
      List<Artikel> artikels =
          body.map((dynamic item) => Artikel.fromJson(item)).toList();

      return artikels;
    } else {
      throw ("Can't get the Article");
    }
  }
}
