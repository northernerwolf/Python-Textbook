import '../../import.dart';
import '../beginner/beginner_page.dart';
import '../intermediate/intermediate_page.dart';
import '../interview/interview_screen.dart';
import '../practice/practice_page.dart';
import '../tests/tests_pip.dart';
import '../videos/videos.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> titles = [
    'Beginner',
    'Intermediate',
    'Practice Programs',
    'Interview Questions',
    'Video tutorials',
    'Tests'
  ];

  void _goToPage(int number) {
    Widget page = BeginnerPage();

    // You can also use if else here.
    switch (number) {
      case 0:
        page = BeginnerPage();
        break;
      case 1:
        page = IntermediatePage();
        break;
      case 2:
        page = PracticePage();
        break;
      case 3:
        page = InterviewPage();
        break;
      case 4:
        page = VideosScreen();
        break;
      case 5:
        page = QuizApp(
          title: "Python",
        );
        break;
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return page;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Col.background,
      appBar: AppBar(
        flexibleSpace: colorfulAppBar,
        backgroundColor: Col.blue,
        title: Text(
          'Python Textbook',
          style: textStyle(),
        ),
        titleTextStyle: style22600(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3.5,
              child: Image.asset('assets/images/python.png'),
            ),
            SizedBox(
              height: 700,
              child: Container(
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Col.amber,
                        Col.blue,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(
                          left: 10, top: 15, right: 10, bottom: 15),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .95,
                        crossAxisSpacing: 13,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return InkWell(
                          enableFeedback: true,
                          child: CustomGridTile(
                            imgIndex: index,
                            title: titles[index],
                          ),
                          onTap: () {
                            _goToPage(index);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
