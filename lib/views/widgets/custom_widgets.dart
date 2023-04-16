import 'package:flutter/material.dart';
import 'package:school_app/config/colors.dart';

// ignore: camel_case_types
Container myTextField({icon, text, password = false, controller, autofill}) {
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
      controller: controller,
      autofillHints: autofill,
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

class DialogBuilder {
  DialogBuilder(this.context);

  final BuildContext context;

  void showLoadingIndicator(String text, String header) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              backgroundColor: Colors.deepOrange,
              content: LoadingIndicator(text: text, header: header),
            ));
      },
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({this.text = '', this.header = ''});

  final String text;
  final String header;

  Padding _getLoadingIndicator() {
    return Padding(
        child: Container(
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: Colors.deepOrange,
            ),
            width: 32,
            height: 32),
        padding: const EdgeInsets.only(bottom: 16));
  }

  Widget _getHeading(context, String headerText) {
    return Padding(
        child: Text(
          headerText,
          textAlign: TextAlign.center,
        ),
        padding: const EdgeInsets.only(bottom: 4));
  }

  Text _getText(String displayedText) {
    return Text(
      displayedText,
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    var displayedText = text;
    var headerText = header;
    return Container(
        padding: EdgeInsets.all(16),
        color: Colors.grey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _getLoadingIndicator(),
              _getHeading(context, headerText),
              _getText(displayedText)
            ]));
  }
}

