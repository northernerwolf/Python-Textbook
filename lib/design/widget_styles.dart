import '/import.dart';

roundedBottom() {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(15),
      bottomRight: Radius.circular(15),
    ),
  );
}

roundedAll() {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(15)),
  );
}

var colorfulAppBar = Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(15),
      bottomRight: Radius.circular(15),
    ),
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Colors.black,
        Col.blue,
      ],
    ),
  ),
);
