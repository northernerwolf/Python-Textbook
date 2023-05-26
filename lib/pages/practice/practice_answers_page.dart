import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../design/colors.dart';
import '../../design/widget_styles.dart';

class PracticeAnswersPage extends StatelessWidget {
  PracticeAnswersPage({required this.index});

  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        flexibleSpace: colorfulAppBar,
        title: Text('Practice'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 56),
        child: PhotoView(
          imageProvider: AssetImage('assets/pics/$index.png'),
          backgroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 88, 0, 81),
                Col.blue,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
    );
  }
}
