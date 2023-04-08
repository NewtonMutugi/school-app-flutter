import 'package:flutter/material.dart';
import 'package:school_app/config/colors.dart';

Container _myTextField({icon, text, password = false}) {
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
    padding: EdgeInsets.only(left: 20, right: 20),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 20,
              offset: Offset(0, 10))
        ]),
    child: TextField(
      cursorColor: Color(0xffff13234),
      decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(icon, color: Color.fromARGB(255, 235, 95, 2))),
      obscureText: password,
    ),
  );
}

Container _myButton({label, action}) {
  return Container(
    margin: EdgeInsets.only(top: 50, left: 20, right: 20),
    padding: EdgeInsets.fromLTRB(20, 15, 20, 20),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Color.fromARGB(255, 235, 95, 2),
      gradient: my_gradient,
      boxShadow: const [
        BoxShadow(
            offset: Offset(0, 10), blurRadius: 20, color: Color(0xffEEEEE))
      ],
    ),
    child: GestureDetector(
      onTap: action,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}

Text _myTextWidget(label, [size = 30, color = Colors.orangeAccent]) {
  return Text(
    label,
    style: TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: size,
        fontFamily: "Roboto"),
  );
}
