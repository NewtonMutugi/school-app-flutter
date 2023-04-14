import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:school_app/models/unit.dart';
import 'package:school_app/models/unit.dart';

class UnitController extends GetxController {
  var isLoading = true.obs;
  var units = <Unit>[].obs;

  @override
  void onInit() {
    fetchUnits();
    super.onInit();
  }

  Future<void> fetchUnits() async {
    isLoading(true);
    try {
      var response = await http.get(Uri.parse('https://yourapi.com/units'));
      if (response.statusCode == 200) {
        var unitsJson = json.decode(response.body) as List;
        units.assignAll(unitsJson.map((unit) => Unit.fromJson(unit)).toList());
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> addUnit(Unit unit) async {
    try {
      var response = await http.post(
        Uri.parse('https://yourapi.com/units'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(unit.toJson()),
      );
      if (response.statusCode == 201) {
        units.add(unit);
        Get.back();
        Get.snackbar(
          "Success",
          "Unit added successfully",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          "Error",
          "Failed to add unit",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to add unit",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void navigateToUnitForm() {
    Get.toNamed('/unitForm');
  }
}
