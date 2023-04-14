import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/controllers/unit_controller.dart';
import 'package:school_app/models/unit.dart';

class AddUnitScreen extends StatelessWidget {
  final UnitController unitController = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController venueController = TextEditingController();
  final TextEditingController dayOfWeekController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController facilitatorController = TextEditingController();

  void _saveUnit() {
    Unit unit = Unit(
      name: nameController.text,
      venue: venueController.text,
      dayOfWeek: dayOfWeekController.text,
      duration: int.parse(durationController.text),
      facilitator: facilitatorController.text,
    );
    unitController.addUnit(unit);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Unit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: venueController,
              decoration: InputDecoration(
                labelText: 'Venue',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: dayOfWeekController,
              decoration: InputDecoration(
                labelText: 'Day of Week',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: durationController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Duration (in hours)',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: facilitatorController,
              decoration: InputDecoration(
                labelText: 'Facilitator',
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _saveUnit,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
