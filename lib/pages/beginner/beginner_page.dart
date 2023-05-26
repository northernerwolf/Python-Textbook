import 'package:flutter/material.dart';

import '../../design/colors.dart';
import '../../design/text_styles.dart';
import '../../design/widget_styles.dart';
import '../../details/contents.dart';
import '../details_page.dart';
import 'beginner.dart';

class BeginnerPage extends StatelessWidget {
  BeginnerPage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          flexibleSpace: colorfulAppBar,
          title: Text("Beginner"),
          centerTitle: true,
          elevation: 8,
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Col.amber,
                    Col.blue,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              height: double.infinity,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: beginnerTitles.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((_) {
                            return DetailsPage(
                              title: beginnerTitles[index],
                              index: beginnerIndexes[index],
                            );
                          }),
                        ),
                      );
                    },
                    child: Card(
                      shape: roundedAll(),
                      color: Col.background,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Col.blue,
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: textStyle(size: 14),
                              ),
                            ),
                          ),
                          Text(
                            beginnerTitles[index],
                            style: textStyle(size: 18),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
