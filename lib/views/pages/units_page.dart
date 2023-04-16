import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:school_app/config/colors.dart';
import 'package:school_app/controllers/unit_controller.dart';
import 'package:school_app/models/unit.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class UnitsPage extends StatelessWidget {
  const UnitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return UnitsWidget();
  }
}

class UnitsWidget extends StatelessWidget {
  final UnitController unitController = Get.put(UnitController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: const Text('My Registered Units'),
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
      body: GetX<UnitController>(
        builder: (controller) {
          if (controller.units.isEmpty) {
            return Center(
              child: Text('No units found'),
            );
          } else {
            return ListView.builder(
              itemCount: controller.units.length,
              itemBuilder: (context, index) {
                final Unit unit = controller.units[index];
                return ListTile(
                  title: Text(unit.name),
                  subtitle: Text(unit.venue),
                  trailing: Text(unit.duration.toString() + ' hours'),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddUnitScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddUnitScreen extends StatelessWidget {
  const AddUnitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: const Text('Add Unit'),
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
      body: UnitSelectionPage(units: []),
    );
  }
}

class UnitSelectionPage extends StatelessWidget {
  final List<Unit> units;

  UnitSelectionPage({required this.units});

  final selectedUnits = <Unit>[].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Units'),
      ),
      body: ListView.builder(
        itemCount: units.length,
        itemBuilder: (BuildContext context, int index) {
          final unit = units[index];
          return Obx(() => CheckboxListTile(
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
              ));
        },
      ),
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
