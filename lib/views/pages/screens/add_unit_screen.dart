import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/config/colors.dart';
import 'package:school_app/controllers/unit_controller.dart';
import 'package:school_app/models/unit.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class AddUnitScreen extends StatelessWidget {
  AddUnitScreen({super.key});
  List<Unit> units = [];

  final selectedUnits = <Unit>[].obs;
  final UnitController _unitController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text('Add Unit'),
        elevation: 30,
        gradient: my_gradient,
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        flexibleSpace: SizedBox(
          height: 200,
        ),
      ),
      body: Obx(() {
        if (_unitController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: units.length,
          itemBuilder: (BuildContext context, int index) {
            final unit = units[index];
            CheckboxListTile(
              title: Text(unit.name),
              subtitle: Text('Facilitator: ${unit.facilitator}'),
              value: selectedUnits.contains(unit),
              onChanged: (bool? value) {
                if (value!) {
                  selectedUnits.add(unit);
                } else {
                  selectedUnits.remove(unit);
                }
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
// Handle saving of selected units
        },
        label: Text('Save'),
        icon: Icon(Icons.save),
      ),
    );  
  }
}
