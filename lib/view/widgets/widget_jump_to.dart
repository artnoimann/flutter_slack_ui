import 'package:flutter/material.dart';

JumpTo(bool autofocus, double widthInput, Function? function(),) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15,),
      child: Container(
        height: 50,
        width: widthInput,
        child: TextField(
          onTap: function,
          autofocus: autofocus,
          keyboardType: autofocus ? TextInputType.text : TextInputType.none,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: 'Jump to...',
            hintStyle: TextStyle(
              height: 0.9,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
  );
}