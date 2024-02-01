import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class loads extends StatefulWidget {
  @override
  _loadsState createState() => _loadsState();
}

class _loadsState extends State<loads> {
  late Timer timer;
  late ScrollController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    timer = Timer.periodic(Duration(seconds: 3), (Timer t) {
      if (_currentIndex < 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _controller.animateTo(
        _currentIndex * MediaQuery.of(context).size.width,
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 18, top: 15),
              child: Text(
                "Hi Manoj,",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border(
                  bottom: BorderSide(color: Colors.orange, width: 6),
                  top: BorderSide(color: Colors.orange),
                  right: BorderSide(color: Colors.orange),
                  left: BorderSide(color: Colors.orange),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(63, 0, 10, 5),
                        child: Text(
                          "From,",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 30, 5),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                              child: Icon(Icons.circle_outlined,
                                  color: Colors.white),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Load from...',
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: CustomPaint(
                          size: Size(30, 20),
                          painter: DottedLinePainter(),
                        ),
                      ),
                      SizedBox(width: 9),
                      Text("To,"),
                      Spacer(),
                      Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.swap_vert,
                                color: Colors.grey),
                          )),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 30, 10),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orangeAccent,
                          ),
                          child: Icon(Icons.location_on_outlined,
                              color: Colors.white),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Unload to...',
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(60, 10, 30, 10),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(5.0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                        fixedSize: MaterialStateProperty.all<Size>(
                            Size(double.maxFinite, 35)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.grey.shade400),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Confirm",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Center(
                child: Image.asset('assets/offerimage.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Center(
                child: SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _controller,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Image.asset('assets/sale${index + 1}.png');
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Center(
                child: Image.asset('assets/delivery.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    double startY = 0;
    double startX = size.width / 2;

    while (startY < size.height) {
      canvas.drawLine(
          Offset(startX, startY), Offset(startX, startY + 4), paint);
      startY += 8;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
