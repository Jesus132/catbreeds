import 'package:flutter/material.dart';
import 'dart:async';

import 'package:catbreeds/core/models/cat_model.dart';
import 'package:catbreeds/core/services/landing_service.dart';
import 'package:catbreeds/core/widgets/card.dart';

class LandingPage extends StatefulWidget {
  LandingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LandingPage();
  }
}

class _LandingPage extends State<LandingPage> {
  _LandingPage();

  final password = TextEditingController();
  bool loading = true;
  List<Cat> cats = [];
  List<Cat> _cats = [];

  @override
  void initState() {
    get();
  }

  void get() async {
    cats = await FetchBreeds().fetchBreeds();
    setState(() {
      _cats = cats;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(238, 238, 252, 1),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 75.0,
          ),
          Material(
            child: TextFormField(
              initialValue: '',
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (text) {
                final cats = (text.isEmpty)
                    ? _cats
                    : _cats
                        .where((cat) => cat.name
                            .toLowerCase()
                            .startsWith(text.toLowerCase()))
                        .toList();
                Timer(const Duration(milliseconds: 200), () {
                  this.cats = cats;
                  loading = false;
                  setState(() {});
                });
                setState(() {
                  this.cats = [];
                  loading = true;
                });
              },
            ),
          ),
          loading
              ? Container(
                  height: 400.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Expanded(
                  child: ListView(
                    children: <Widget>[
                      ...cats.map((item) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              'details',
                              arguments: item,
                            );
                          },
                          child: CardCat(cat: item),
                        );
                      }),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
