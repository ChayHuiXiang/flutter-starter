import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

  final bool checkboxValue;
  final String taskName;
  final Function(bool?) onChanged;
  final Function() onLongPress;

  TaskTile({required this.checkboxValue, required this.taskName, required this.onChanged, required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      trailing: Checkbox(
        onChanged: onChanged,
        value: checkboxValue,
      ),
      title: Text(taskName,style: TextStyle(
        decoration: checkboxValue ? TextDecoration.lineThrough : null,
      ),)
    );
  }
}