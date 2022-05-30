import 'package:flutter/material.dart';

import 'package:catbreeds/core/models/cat_model.dart';

class CardCat extends StatefulWidget {
  final Cat cat;

  const CardCat({Key? key, required this.cat}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CardCat(cat: cat);
  }
}

class _CardCat extends State<CardCat> {
  final Cat cat;

  _CardCat({required this.cat});

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: const EdgeInsets.only(bottom: 14.0),
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(
              5.0,
              5.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                cat.name,
                style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const Text(
                'Mas...',
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          Hero(
            tag: cat.id,
            child: FadeInImage(
              // // placeholder: const AssetImage('assets/img/loading.gif'),
              placeholder: const AssetImage('assets/img/no-image.jpg'),
              image: NetworkImage(cat.image.url),
              fit: BoxFit.cover,
              height: 200,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                cat.origin,
                style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                '${cat.intelligence}',
                style: const TextStyle(fontSize: 14.0, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
