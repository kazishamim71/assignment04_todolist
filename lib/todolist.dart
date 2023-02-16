import 'package:assignment04_todolist/style.dart';
import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  //modal bottom sheet is used from anywhere in the screen for getting data from users
  //bottom sheet is used only for showing data

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<String> todos=[];
  TextEditingController todoETcontroller=TextEditingController();
  final _formKey=GlobalKey<FormState>();
  bool isVisible=true;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('TO DO LIST'),),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index){
            return Dismissible(
              key: Key(_formKey.currentState.toString()),
              onDismissed: (context){
                todos.removeAt(index);
              },
              child: Card(
                elevation: 5,

                child: sizedBox50(
                  Row(
                    children: [
                      Expanded(flex: 80, child: Text(todos[index], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                      Expanded(flex: 20, child: TextButton(
                        onPressed: (){
                          setState(() {
                            todos.removeAt(index);
                          });

                        }, child: Icon(Icons.delete),
                      )),

                    ],
                  ),
                ),

              ),
            );

          }),
      floatingActionButton: FloatingActionButton(
        child: const Text('Add'),
        onPressed: (){
          showModalBottomSheet(
              isDismissible: true,

              barrierColor: Colors.black12,
              backgroundColor: Colors.yellowAccent.shade100,


              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )
              ),

              isScrollControlled: false,
              // enableDrag: true,
              context: context,
              builder: (context){
                return Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: AppInputDecoration("List Item"),
                          validator: (value){
                            if(value==null || value.isEmpty){
                              return 'Please enter some text ';
                            }else {
                              return null;
                            }

                          },

                          controller: todoETcontroller,
                        ),

                        ElevatedButton(onPressed: (){

                          /*if(todoETcontroller.text.trim()!=""){
                            todos.add(todoETcontroller.text.trim());
                            todoETcontroller.clear();
                          }*/
                          if(_formKey.currentState!.validate()){
                            todos.add(todoETcontroller.text.trim());
                            todoETcontroller.clear();
                            setState(() {});
                            Navigator.pop(context);

                          }

                        },
                          child:const Text('Add Item'),
                          style: AppButtonStyle(),
                        )
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}