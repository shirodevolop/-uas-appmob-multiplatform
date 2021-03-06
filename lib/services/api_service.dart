import 'dart:convert';
import 'package:app/models/news.dart';
import 'package:http/http.dart';

class ApiService {
  final endPointUrl = "https://jaroji.web.id/api/news.php";

  Future<List<News>> getNews() async {
    final response = await get(Uri.tryParse(endPointUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['berita'];
      List<News> berita = body.map((item) => News.fromJson(item)).toList();
      return berita;
    } else {
      throw Exception("Berita Tidak ditemukan !");
    }
  }
}
