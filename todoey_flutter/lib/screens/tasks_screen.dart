import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'add_task_screen.dart';
import '../widgets/tasks_list.dart';
import 'package:provider/provider.dart';
import '../models/data.dart';

class TasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Color(0xFF42c0fe),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              addTaskScreen(context);
            },
            backgroundColor: Colors.lightBlueAccent,
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(
                      top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30.0,
                        child: Icon(
                          Icons.list,
                          color: Color(0xFF42c0fe),
                          size: 30.0,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text('Todoey',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 50.0,
                          )),
                      Text('${Provider.of<Data>(context).taskCount} Tasks',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          )),
                    ],
                  )),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TasksList(),
                    )),
              ),
            ],
          )
    );
  }
}