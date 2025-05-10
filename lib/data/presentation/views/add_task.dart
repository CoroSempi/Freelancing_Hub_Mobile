import 'package:flutter/material.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';

class AddTaskScreen extends StatelessWidget {
  static const routeName = '/add-task';

  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: const Center(child: Text('Add Task Screen')),
    );
  }
}
