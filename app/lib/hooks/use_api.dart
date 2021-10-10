import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:xml/xml.dart';
import 'package:intl/intl.dart';

String aladinHost = "www.aladin.co.kr";
String aladinFeedPath = "ttb/api/ItemLookUp.aspx";
String aladinSearchPath = "ttb/api/ItemSearch.aspx";

Map<String, String> _monthMap = {
  "Jan": "01",
  "Feb": "02",
  "Mar": "03",
  "Apr": "04",
  "May": "05",
  "Jun": "06",
  "Jul": "07",
  "Aug": "08",
  "Sep": "09",
  "Oct": "10",
  "Nov": "11",
  "Dec": "12"
};

///////////////////// search //////////////////////
Map<String, dynamic> _aladinSearchParam(String query, int page) {
  Map<String, dynamic> ret = {
    "ttbkey": dotenv.env["TTBKEY"],
    "query": query,
    "output": "js",
    "start": page.toString(),
    "maxresults": "10",
    "Version": "20131101",
    "Cover": "Big"
  };
  return ret;
}

Future<Map<String, dynamic>> searchAladinApiGet(String query, int page) async {
  Map<String, dynamic> _param = _aladinSearchParam(query, page);

  http.Response response = await http.get(
      Uri(
          scheme: "http",
          host: aladinHost,
          path: aladinSearchPath,
          queryParameters: _param),
      headers: {"Accept": "application/json"});
  return jsonDecode(response.body);
}

Map<String, dynamic> _aladinFeedParam(String isbn13) {
  Map<String, dynamic> ret = {
    "ttbkey": dotenv.env["TTBKEY"],
    "itemIdType": "ISBN13",
    "ItemId": isbn13,
    "output": "XML",
    "Omitkey": "1",
    "Cover": "Big"
  };
  return ret;
}

///////////////////// search //////////////////////
///////////////////// feed //////////////////////
Future<Map<String, dynamic>> feedAladinApiGet(String isbn13) async {
  Map<String, dynamic> _param = _aladinFeedParam(isbn13);

  http.Response response = await http.get(
      Uri(
          scheme: "http",
          host: aladinHost,
          path: aladinFeedPath,
          queryParameters: _param),
      headers: {"Accept": "application/json"});
  Map<String, dynamic> res;
  String body = response.body;
  final document = XmlDocument.parse(body);
  List<String> t =
      document.findAllElements("pubDate").toList()[1].text.split(" ");
  String formatDateTime = DateFormat.yMMMd("ko_KR")
      .format(DateTime.parse(t[3] + "-" + _monthMap[t[2]]! + "-" + t[1]));

  res = {
    "title": document.findAllElements("title").toList()[1].text,
    "author": document.findAllElements("author").toList()[0].text,
    "pubDate": formatDateTime,
    "cover": document.findAllElements("cover").toList()[0].text,
    // "isbn13": document.findAllElements("isbn13").toList()[0].text,
    "isbn": document.findAllElements("isbn").toList()[0].text,
    "publisher": document.findAllElements("publisher").toList()[0].text,
    "categoryName": document.findAllElements("categoryName").toList()[0].text,
    "description": document
        .findAllElements("description")
        .toList()[0]
        .text
        .replaceAllMapped(RegExp('(&lt;)|(&gt;)|(<.+?\/>)'),
            (Match m) => ""), //(&lt;)|(&gt;)|(<.+?\/>)
  };
  return res;
}
///////////////////// feed //////////////////////