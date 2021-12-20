import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/data.dart';

Future<dynamic> addTaskScreen(BuildContext context) {

  String? textInput;

  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) => SingleChildScrollView(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
            padding: EdgeInsets.only(top: 30.0,left:50.0,right:50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 30.0,
                  ),
                ),
                TextField(
                  textAlign: TextAlign.center,
                  autofocus: true,
                  onChanged: (value){
                    textInput = value;
                  },
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical:20.0),
                  child: TextButton(
                    onPressed: (){
                      Provider.of<Data>(context, listen: false).addTask(textInput);
                      Navigator.pop(context);
                    },
                    child: Text('Add',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                        shape: MaterialStateProperty.all<OutlinedBorder>(BeveledRectangleBorder(borderRadius: BorderRadius.zero))
                    ),
                  ),
                ),
              ],
            )
        ),
      ));
}