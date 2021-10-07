import 'package:flutter/material.dart';
import 'package:app/screens/detail_screen.dart';
import 'package:app/models/book_models.dart';
import 'package:flutter/widgets.dart';
import 'package:transparent_image/transparent_image.dart';

class ContentScroll extends StatelessWidget {
  final List<Book> books;
  final String listTitle;
  final double imageHeight;
  final double imageWidth;

  ContentScroll(
    this.books,
    this.listTitle,
    this.imageHeight,
    this.imageWidth,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 50.0,
          ),
          width: double.infinity,
          child: Text(
            listTitle,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 21.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: imageHeight,
          child: books.isEmpty == true
              ? const Center(
                  child: Text("결과가 없습니다.",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold)))
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: books.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailScreen(book: books[index]),
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 20.0,
                        ),
                        width: imageWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.black54,
                              offset: Offset(0.0, 4.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Hero(
                          tag: books[index].coverUrl,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: books[index].coverUrl,
                              height: 400.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
