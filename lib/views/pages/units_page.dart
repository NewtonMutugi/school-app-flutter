import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:school_app/controllers/unit_controller.dart';
import 'package:school_app/models/unit.dart';

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
      appBar: AppBar(
        title: Text('Units'),
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

class AddUnitScreen {}
