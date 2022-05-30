import 'package:flutter/material.dart';

import 'package:catbreeds/core/models/cat_model.dart';

class CardDetailsPage extends StatefulWidget {
  CardDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CardDetailsPage();
  }
}

class _CardDetailsPage extends State<CardDetailsPage> {
  _CardDetailsPage();

  @override
  Widget build(BuildContext context) {
    const styleTexts = TextStyle(fontSize: 18.0, color: Colors.black);
    double _height = MediaQuery.of(context).size.height;
    final Cat cat = ModalRoute.of(context)!.settings.arguments as Cat;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(cat.name),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(
            tag: cat.id,
            child: FadeInImage(
              placeholder: const AssetImage('assets/img/no-image.jpg'),
              image: NetworkImage(cat.image.url),
              fit: BoxFit.cover,
              height: _height * 0.6,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          SizedBox(
            width: double.infinity,
            height: _height * 0.2,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: ListView(
                children: [
                  Text(
                    cat.description,
                    style: styleTexts,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    cat.origin,
                    style: styleTexts,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '${cat.adaptability}',
                    style: styleTexts,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    cat.lifeSpan,
                    style: styleTexts,
                  ),
                  // // Text(cat),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
