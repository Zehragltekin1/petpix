import 'package:flutter/material.dart';
import 'package:petpix/pages/cards/card_model.dart';
import 'package:petpix/pages/cards/firstcard.dart';
import 'package:petpix/pages/cards/secondcard.dart';
import 'package:petpix/pages/cards/thirdcard.dart';


class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OptionCard(
          title: 'Arama Yap',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchView()),
            );
          },
        ),
        OptionCard(
          title: 'Eşleştirme Formuna Git',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondPage()),
            );
          },
        ),
        OptionCard(
          title: 'Eşleştirme Formu oluştur',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ThirdPage()),
            );
          },
        ),
      ],
    );
  }
}


  





