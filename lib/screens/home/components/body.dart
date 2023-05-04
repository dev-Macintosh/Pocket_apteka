import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pocket_apteka/constants.dart';
import 'header_with_searchbox.dart';
import 'own_medicaments.dart';
import 'recommended_medicaments.dart';
import 'text_with_more_btn.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        HeaderWithSearchBox(size: size),
        TextWithMoreBtn(
          title: "Ваши лекарства",
          press: () {},
        ),
        RecommendedMedicaments(),
        TextWithMoreBtn(
          title: "Рекомендованные лекарства",
          press: () {},
        ),
        OwnMedicaments(),
        SizedBox(height: kPaddingOffset,)
      ]),
    );
  }
}

