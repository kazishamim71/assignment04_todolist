import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      // home: const CounterScreen(),
      home: const ToDoList(),
    );
  }
}

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

                child: Container(



                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(5),
                  height: 80,
                  color: Colors.yellowAccent,

                  child: ListTile(
                    title: Text(todos[index],style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                     leading: Icon(Icons.pin_drop_rounded, color: Colors.red,),



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
              backgroundColor: Colors.yellowAccent.shade400,


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
                          decoration: const InputDecoration(
                            hintText: 'Write New To Do here',
                          ),
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