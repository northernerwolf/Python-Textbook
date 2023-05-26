import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:test_app/design/text_styles.dart';
import 'package:test_app/pages/interview/questions.dart';

import '../../design/colors.dart';
import '../../design/widget_styles.dart';
import 'answers.dart';

class InterviewPage extends StatelessWidget {
  InterviewPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 46, 43, 32),
      appBar: AppBar(
        flexibleSpace: colorfulAppBar,
        title: Text('Interview Questions'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: ((context, index) {
            return Card(
              color: Color.fromARGB(83, 6, 17, 39),
              shape: roundedAll(),
              child: ExpansionTileCard(
                finalPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                expandedColor: Colors.blueGrey[800],
                expandedTextColor: Color.fromARGB(255, 23, 0, 235),
                baseColor: Color.fromARGB(136, 59, 78, 253),
                title: Text(
                  questions[index],
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 19,
                      color: Col.amber),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                    child: Text(
                      answers[index],
                      style: textStyle(size: 18, color: Colors.red),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
