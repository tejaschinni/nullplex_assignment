import 'package:flutter/material.dart';

class Background1 extends StatefulWidget {
  Widget child;
  String title;
  String subitle;
  String auth;
  VoidCallback ontap;
  Background1(
      {required this.child,
      required this.auth,
      required this.subitle,
      required this.title,
      required this.ontap,
      super.key});

  @override
  State<Background1> createState() => _Background1State();
}

class _Background1State extends State<Background1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(27),
                      bottomRight: Radius.circular(27)),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.21,
                    color: const Color(0xFF6237A0),
                  ),
                ),
                Positioned(
                    top: 60,
                    child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ))),
                Positioned(
                    top: 90,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.subitle,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          GestureDetector(
                            onTap: widget.ontap,
                            child: Text(
                              widget.auth,
                              style: const TextStyle(
                                  color: Color(0xffFFD869), fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    )),
                Positioned(
                    top: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(
                        "assets/logo-white.png",
                        scale: 4,
                      ),
                    )),
                Positioned(
                    right: -10,
                    top: -10,
                    child: CircleAvatar(
                      backgroundColor: const Color(0xFF9969DF).withOpacity(0.7),
                      radius: 40,
                    )),
              ],
            ),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.88,
                    height: 12,
                    // color: Colors.red,
                    color: Color(0xFF8252C8),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.83,
                    height: 10,
                    // color: Colors.red,
                    color: const Color(0xFF9969DF),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            widget.child
          ],
        ),
      ),
    ));
  }
}
