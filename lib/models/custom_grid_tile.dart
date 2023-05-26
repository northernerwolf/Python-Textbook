import '../import.dart';

class CustomGridTile extends StatelessWidget {
  CustomGridTile({
    required this.title,
    required this.imgIndex,
  });
  final int imgIndex;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Color.fromARGB(255, 30, 32, 32),
      shape: roundedAll(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              Col.blue,
              Color.fromARGB(255, 82, 0, 61),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    imgIndex + 1 > 4 ? EdgeInsets.all(8.0) : EdgeInsets.all(0),
                child: SizedBox(
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/${imgIndex + 1}.png',
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 6),
              Text(
                title,
                style: textStyle(),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
