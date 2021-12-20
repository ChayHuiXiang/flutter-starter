import 'task_tile.dart';
import 'package:flutter/material.dart';
import '../models/data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (context, data, child) => ListView.builder(
        itemBuilder: (context, index){
          return TaskTile(
              checkboxValue: data.taskList[index].isDone,
              taskName: data.taskList[index].name,
              onChanged: (bool? value){
                data.toggleTask(index);
              },
              onLongPress: (){
                data.deleteTask(index);
              },
          );
        },
        itemCount: Provider.of<Data>(context).taskCount,
      ),
    );
  }
}