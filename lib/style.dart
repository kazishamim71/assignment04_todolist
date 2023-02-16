
import 'package:flutter/material.dart';

InputDecoration AppInputDecoration(label){

  return InputDecoration(
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
    border: OutlineInputBorder(),
    labelText: label,
    hintText: 'Write New to do here'
  );

}

ButtonStyle AppButtonStyle(){
  return ElevatedButton.styleFrom(

      padding: EdgeInsets.all(10),
      backgroundColor: Colors.green,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
    )
  );
}

SizedBox sizedBox50(child){
  return SizedBox(
    height: 70,
    width: double.infinity,
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      child: child,
    ),
  );
}