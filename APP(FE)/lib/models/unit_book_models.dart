import 'dart:convert';
import 'dart:io';
import 'package:app/models/book_models.dart';
import 'package:app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app/constants/uri.dart';

class UnitBook {
  final String? title;
  final String? author;
  final String? pubDate;
  final String? description;
  final String? isbn;
  late final String? coverUrl;
  final String? publisher;
  final String? category;

  UnitBook(this.title, this.author, this.pubDate, this.description, this.isbn,
      this.coverUrl, this.publisher, this.category);

  UnitBook.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        author = json['author'],
        pubDate = json['pubDate'],
        description = json['description'],
        isbn = json['isbn'],
        coverUrl = json['cover'],
        publisher = json['publisher'],
        category = json['categoryName'];
}

UnitBook defaultUnitBookModel() {
  return UnitBook('text book title', 'author', '2000-01-01', 'book description',
      '123456789', null, 'publisher', 'category');
}

List<UnitBook> getUnitBookList_test() {
  List<UnitBook> myUnitBookList = [];
  UnitBook myUnitBook = UnitBook('text book title', 'author', '2000-01-01',
      'book description', '123456789', null, 'publisher', 'category');
  for (int i = 1; i <= 10; i++) {
    myUnitBookList.add(myUnitBook);
  }
  return myUnitBookList;
}

List<UnitBook> parseUnitBook(dynamic decodedResponseBody) {
  return (decodedResponseBody['books_list'] as List)
      .map((i) => UnitBook.fromJson(i))
      .toList();
}

List<UnitBook> parseBorrowBook(dynamic decodedResponseBody) {
  return (decodedResponseBody['books_list'] as List)
      .map((i) => UnitBook.fromJson(i))
      .toList();
}

//부대 전체 책 리스트 가져오기
Future<List<UnitBook>> getUnitBookList(String unit, int page) async {
  if ( page == null) page = 1;
  final response = await http.get(
    Uri.parse(proxyUri + myUri + 'unit/' + Uri.encodeComponent(unit) + '&$page'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  return parseUnitBook(jsonDecode(utf8.decode(response.bodyBytes)));
}

Future<List<UnitBook>> getUnitTagBookList(String unit, String tag) async {
  final response = await http.get(
    Uri.parse(proxyUri + myUri + 'unit/$tag/Unit_name=' + Uri.encodeComponent(unit)),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  return parseUnitBook(jsonDecode(utf8.decode(response.bodyBytes)));
}

Future<List<UnitBook>> getBorrowBookList(String unit) async {
  final response = await http.get(
    Uri.parse(proxyUri +
        myUri +
        'unit/chk/Unit_name=${myUser!.unit}&user_id=${myUser!.userId}'),

    
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  return parseBorrowBook(jsonDecode(utf8.decode(response.bodyBytes)));
}

Book convertUnitBooktoBook(UnitBook _unitBook) {
  return Book(
    _unitBook.title!,
    _unitBook.author!,
    _unitBook.pubDate!,
    _unitBook.description!,
    _unitBook.coverUrl!.replaceAll('\\/', '/'),
    _unitBook.publisher!,
    _unitBook.category!,
    _unitBook.isbn!,
  );
}