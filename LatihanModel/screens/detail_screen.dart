import 'package:flutter/material.dart';
import 'package:latihan/latihan_model/model/receipe.dart';

class DetailScreen extends StatelessWidget {
  final Receipe receipe;
  const DetailScreen({required this.receipe});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWebPage(
            receipe: receipe,
          );
        } else {
          return DetailMobilePage(
            receipe: receipe,
          );
        }
      },
    );
  }
}

class DetailWebPage extends StatefulWidget {
  final Receipe receipe;

  DetailWebPage({required this.receipe});

  @override
  State<DetailWebPage> createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 64,
          ),
          child: Center(
            child: SizedBox(
              width: screenWidth <= 1200 ? 800 : 1200,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        ClipRRect(
                          child: Image.asset(
                            widget.receipe.imageAsset,
                            width: screenWidth * 0.5,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 32,
                  ),
                  Expanded(
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                widget.receipe.judul,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.timer),
                                    const SizedBox(width: 8),
                                    Text(widget.receipe.waktu),
                                  ],
                                ),
                                FavoriteButton(),
                              ],
                            ),
                            Row(
                              children: [
                                ...List<Widget>.generate(
                                  5,
                                  (index) => Icon(
                                    Icons.star,
                                    color: (index >
                                            int.parse(widget.receipe.rating) -
                                                1)
                                        ? Colors.black
                                        : Colors.orange,
                                    size: 18,
                                  ),
                                ).toList(),
                                const SizedBox(width: 8),
                                Text(widget.receipe.rating + " Rating"),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              widget.receipe.deskripsi,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              "Bahan",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Divider(),
                            Text(
                              widget.receipe.bahan,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              "Langkah",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Divider(),
                            Text(
                              widget.receipe.langkah,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class DetailMobilePage extends StatelessWidget {
  final Receipe receipe;

  const DetailMobilePage({required this.receipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.asset(
                    receipe.imageAsset,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 450,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),
                        FavoriteButton(),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Text(
                  receipe.judul,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        const Icon(Icons.timer),
                        const SizedBox(height: 8.0),
                        Text(
                          receipe.waktu,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: List<Widget>.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: (index > int.parse(receipe.rating) - 1)
                                  ? Colors.black
                                  : Colors.orange,
                              size: 18,
                            ),
                          ).toList(),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          "Rating " + receipe.rating,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(
                  10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      receipe.deskripsi,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Bahan",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(),
                    Text(
                      receipe.bahan,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Langkah",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(),
                    Text(
                      receipe.langkah,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// * FAVORITE BUTTON

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
