import 'package:flutter/material.dart';
import 'package:school_app/config/colors.dart';

// ignore: camel_case_types
Container myTextField({icon, text, password = false}) {
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
          prefixIcon: Icon(icon, color: Color(0XFF36393B))),
      obscureText: password,
    ),
  );
}

Container myhyperlink({label, action, position}) {
  return Container(
    margin: EdgeInsets.only(top: 10, left: 20),
    alignment: Alignment.centerRight,
    child: Column(
      children: [
        SizedBox(width: 20, height: 20),
        GestureDetector(
          onTap: action,
          child: Container(
            alignment: position,
            padding: EdgeInsets.only(right: 25),
            child: Text(label,
                style: const TextStyle(
                  color: Color(0XFF36393B),
                  fontSize: 15,
                )),
          ),
        ),
      ],
    ),
  );
}

Container myButton({label, action}) {
  return Container(
    margin: EdgeInsets.only(top: 50, left: 20, right: 20),
    padding: EdgeInsets.fromLTRB(20, 15, 20, 20),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Color(0XFF36393B),
      //gradient: my_gradient,
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

Text myTextWiget(label, [size = 30, color = const Color(0XFF36393B)]) {
  return Text(
    label,
    style: TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: size,
        fontFamily: "Roboto"),
  );
}

Container myAppBar({label}) {
  return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(75), bottomRight: Radius.circular(75)),
        color: Color.fromARGB(150, 231, 26, 12),
        gradient: my_gradient,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              child:
                  Image.asset("assets/images/logo.png", height: 90, width: 90),
            ),
            Container(
              margin: EdgeInsets.only(right: 20, top: 20),
              alignment: Alignment.bottomRight,
              child: Center(
                child: Text(
                  label,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ));
}
