import 'package:flutter/material.dart';

class CustomTextFieldWIdget extends StatelessWidget {
  String title;
  String hintText;
  bool isvisisble;
  TextInputType type;

  final String? Function(String?)? validator;
  TextEditingController controller;
  CustomTextFieldWIdget(
      {required this.title,
      required this.controller,
      required this.hintText,
      required this.isvisisble,
      required this.validator,
      required this.type,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
      // padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.08,
            child: TextFormField(
              textAlign: TextAlign.left,
              keyboardType: type,
              obscureText: isvisisble,
              controller: controller,
              validator: validator,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffF6F6F6),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffE8E8E8)),
                      borderRadius: BorderRadius.circular(30))),
            ),
          )
        ],
      ),
    );
  }
}
